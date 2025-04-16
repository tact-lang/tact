struct Sub {
    x: Int;
}

struct Middle {
    y: Sub;
}

struct Outer {
    z: Middle;
}

contract OptionalDeep {
    nested: Outer?;

    init() {
        self.nested = null;
    }
}