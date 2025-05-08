struct DeepOptional {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract DeepOptionals {
    foo: DeepOptional;

    init() {
        self.foo = DeepOptional{ x: null, y: null, z: null };
    }
}