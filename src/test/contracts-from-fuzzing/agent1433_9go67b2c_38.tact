struct Tiny {
    foo: Int;
}

struct MidTiny {
    t: Tiny;
}

struct OuterTiny {
    m: MidTiny;
}

contract NestedTiny {
    x: OuterTiny;

    init() {
        self.x = OuterTiny{ m: MidTiny{ t: Tiny{ foo: 1 } } };
    }
}
