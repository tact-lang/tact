struct Foo {
    x: Int as uint8;
    y: Int? as uint8;
}

contract OptSerHint {
    f: Foo;
    init() {
        self.f = Foo{ x: 5, y: 7 };
    }
}