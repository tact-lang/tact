struct Inner {
    a: Int? = null;
    b: Bool? = null;
}

struct Outer {
    x: Int;
    y: Inner;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer {
            x: 5,
            y: Inner {}
        };
    }
}