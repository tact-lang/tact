struct OptionalNest {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract Test {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            x: null,
            y: true,
            z: null,
        };
    }
}
