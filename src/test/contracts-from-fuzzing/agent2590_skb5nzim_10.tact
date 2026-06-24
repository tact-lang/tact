struct OptionalBool {
    x: Bool?;
    y: Bool?;
    z: Bool?;
}

contract OptionalBools {
    foo: OptionalBool;
    init() {
        self.foo = OptionalBool{ x: null, y: true, z: null };
    }
}