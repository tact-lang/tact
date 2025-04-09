struct OptionalNest {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{
            x: null,
            y: true,
            z: null
        };
    }
}