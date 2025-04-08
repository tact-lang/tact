struct OptionalNest {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptTest {
    data: OptionalNest = OptionalNest{
        x: null,
        y: true,
        z: null
    };

    init() {
        self.data = OptionalNest{
            x: 42,
            y: null,
            z: "hello"
        };
    }
}