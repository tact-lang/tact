struct Inner {
    x: Int = 1;
    y: Bool = true;
}

struct Outer {
    a: Inner;
    b: Int = 5;
}

contract TestContract {
    v: Outer;

    init() {
        self.v = Outer{ a: Inner{}, b: 42 };
    }
}