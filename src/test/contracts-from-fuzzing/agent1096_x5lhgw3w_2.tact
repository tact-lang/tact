struct OptionalNested {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract OptionalFields {
    nestedOpt: OptionalNested;
    init() {
        self.nestedOpt = OptionalNested{
            opt1: null,
            opt2: true,
            opt3: null
        };
    }
}