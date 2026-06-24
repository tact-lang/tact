struct OptionalNested {
    innerVal: Int?;
    flag: Bool?;
}

contract OptionalFields {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{innerVal: null, flag: true};
    }
}