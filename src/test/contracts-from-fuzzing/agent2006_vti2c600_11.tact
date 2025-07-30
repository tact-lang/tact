struct OptBoolInt {
    b: Bool?;
    i: Int?;
}

contract OptionalMultiField {
    data: OptBoolInt;
    init() {
        self.data = OptBoolInt {
            b: null,
            i: null,
        };
    }
}