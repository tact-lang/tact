struct OptNested {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructFields {
    s1: OptNested?;
    s2: OptNested;

    init() {
        self.s1 = null;
        self.s2 = OptNested{
            x: 1,
            y: null,
            z: "test"
        };
    }
}
