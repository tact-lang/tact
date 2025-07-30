const BASE: Int = 99;

struct S {
    v: Int = BASE;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{};
    }
}