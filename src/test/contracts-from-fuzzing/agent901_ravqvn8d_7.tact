struct OptionalNest {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract OptionalStruct {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            s: null,
            i: null,
            b: null
        };
    }
}