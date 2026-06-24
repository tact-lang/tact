struct OptionalNest {
    x: Int?;
    y: String?;
    z: Cell?;
    k: Bool?;
}

contract OptNested {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            x: null,
            y: null,
            z: null,
            k: null,
        };
    }
}
