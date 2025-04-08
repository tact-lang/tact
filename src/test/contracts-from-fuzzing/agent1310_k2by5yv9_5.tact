struct C { p: Int = 7; q: Int?; }

struct B { inner: C; }

contract TestContract {
    x: B;

    init() {
        self.x = B{ inner: C{ p: 100, q: null } };
    }
}
