struct OptNest {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptContract {
    optField: OptNest;

    init() {
        self.optField = OptNest{
            x: null,
            y: true,
            z: "hello"
        };
    }
}