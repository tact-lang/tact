struct Inner {
    foo: Int = 7;
    bar: Bool = true;
}

struct Wrap {
    a: Inner;
}

contract TestContract {
    w: Wrap;

    init() {
        self.w = Wrap{ a: Inner{} };
    }
}