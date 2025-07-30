struct OptionalLayer {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalNested {
    nest: OptionalLayer?;
    init() {
        self.nest = OptionalLayer{
            x: null,
            y: true,
            z: "hello",
        };
    }
}