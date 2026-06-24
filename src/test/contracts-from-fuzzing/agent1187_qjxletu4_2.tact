struct Nested {
    x: Int;
    y: Bool;
    z: String;
}

contract HasNested {
    foo: Nested = Nested{
        x: 1,
        y: true,
        z: "hello",
    };

    init() {
        self.foo = Nested{
            x: 2,
            y: false,
            z: "bye",
        };
    }
}