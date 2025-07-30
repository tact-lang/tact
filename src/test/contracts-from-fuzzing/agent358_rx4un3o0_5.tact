struct OptionalNested {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructTest {
    optData: OptionalNested;

    init() {
        self.optData = OptionalNested{
            x: null,
            y: null,
            z: null
        };
    }
}
