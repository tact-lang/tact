struct OptNest {
    x: Int;
    y: Bool?;
    z: String?;
}

contract OptionalNested {
    param: OptNest;
    init() {
        self.param = OptNest{
            x: 5,
            y: null,
            z: "hello",
        };
    }
}