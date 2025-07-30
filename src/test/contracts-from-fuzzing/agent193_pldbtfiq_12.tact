struct Middle {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Middle;
    y: Int;
}

contract OptionalFields {
    foo: Outer?;

    init() {
        self.foo = null;
    }
}