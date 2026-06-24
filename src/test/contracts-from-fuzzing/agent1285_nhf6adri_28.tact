// Deep nest with mixed defaults and assigned values
struct Z {
    v: Int = 123;
}

struct Y {
    p: Z;
}

struct X {
    q: Y;
}

contract TestContract {
    x: X;
    init() {
        self.x = X{ q: Y{ p: Z{ } } };
    }
}