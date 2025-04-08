struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    c: Inner?;
}

contract OptionalInsideOptional {
    outer: Outer?;

    init() {
        self.outer = null;
    }

    receive() {
        self.outer = Outer{ c: Inner{ a: 1, b: null } };
    }
}