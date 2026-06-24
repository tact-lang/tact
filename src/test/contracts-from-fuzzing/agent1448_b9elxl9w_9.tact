struct Foo {
    a: Int as int64;
    b: Int as uint8;
    c: Bool;
    d: Bool?;
}

contract SerializationTest {
    x: Foo;

    init() {
        self.x = Foo{ a: -1, b: 255, c: true, d: null };
    }
}