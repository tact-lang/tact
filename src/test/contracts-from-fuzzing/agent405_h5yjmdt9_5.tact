struct PartialDefaults {
    x: Int = 5;
    y: Bool? = null;
    z: String?;
}

contract TestPartial {
    data: PartialDefaults = PartialDefaults{
        z: "hello"
    };

    init() {
        self.data = PartialDefaults{
            x: 42,
            y: true,
            z: null,
        };
    }
}