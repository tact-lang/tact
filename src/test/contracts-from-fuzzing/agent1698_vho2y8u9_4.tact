struct OptionalNest {
    x: Int?;
    y: Bool?;
}

contract OptionalInStruct {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{x: null, y: true};
    }
}