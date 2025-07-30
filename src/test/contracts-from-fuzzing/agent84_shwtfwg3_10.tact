struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
}

struct Wrap {
    a: Inner1?;
    b: Inner2?;
}

contract TestContract {
    w: Wrap = Wrap{ a: null, b: null };

    init() {
        self.w = Wrap{ a: null, b: null };
    }
}