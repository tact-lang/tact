struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract NestTest {
    foo: Nested;

    init() {
        self.foo = Nested{ x: 1, y: true, z: "z" };
    }
}