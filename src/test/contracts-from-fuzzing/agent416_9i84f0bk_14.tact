struct Base {
    a: Int;
    b: Int as uint8;
    c: Int as uint16;
}

contract WithSerialized {
    base: Base;

    init() {
        self.base = Base{ a: 1, b: 2, c: 3 };
    }
}