struct MultiPrim {
    x: Int;
    y: Int as uint32;
    z: Bool;
    s: String;
}

contract MixedTypesTest {
    mixed: MultiPrim;

    init() {
        self.mixed = MultiPrim{
            x: -5,
            y: 42,
            z: false,
            s: "test"
        };
    }
}
