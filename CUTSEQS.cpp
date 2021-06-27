#include <iostream>
#include <queue>

using namespace std;

const unsigned long long oo = 1ll << 63;
int n, a[100015];
unsigned long long m, IT[400015], f[100015];
deque <int> pos;

void ITbuild(int k, int l, int r) {
    IT[k] = oo;
    if (l == r) return;
    ITbuild(2 * k, l, (l + r) / 2);
    ITbuild(2 * k + 1, (l + r) / 2 + 1, r);
}

void ITupdate(int x, unsigned long long v, int k, int l, int r) {
    if (x < l || r < x) return;
    if (l == r) IT[k] = v;
    else {
        ITupdate(x, v, 2 * k, l, (l + r) / 2);
        ITupdate(x, v, 2 * k + 1, (l + r) / 2 + 1, r);
        IT[k] = min(IT[2 * k], IT[2 * k + 1]);
    }
}

int main() {
    cin >> n >> m;
    ITbuild(1, 1, n);
    unsigned long long sum = 0;
    for (int i = 1, j = 1; i <= n; i++) {
        cin >> a[i];
        if (a[i] > m) {
            cout << -1; return 0;
        }
        sum += a[i];
        while (sum > m) sum -= a[j++];
        while (!pos.empty() && a[pos.back()] <= a[i])
            ITupdate(pos.back(), oo, 1, 1, n), pos.pop_back();
        while (!pos.empty() && pos.front() < j)
            ITupdate(pos.front(), oo, 1, 1, n), pos.pop_front();
        if (pos.empty()) ITupdate(i, a[i] + f[j - 1], 1, 1, n);
        else
            ITupdate(pos.front(), a[pos.front()] + f[j - 1], 1, 1, n),
            ITupdate(i, a[i] + f[pos.back()], 1, 1, n);
        pos.push_back(i);
        f[i] = IT[1];
    }
    cout << f[n];
}
