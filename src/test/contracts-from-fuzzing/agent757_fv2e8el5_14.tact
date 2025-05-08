struct OptBoolInt {
    b: Bool?;
    i: Int?;
}

contract OptionalBoth {
    data: OptBoolInt;

    init() {
        self.data = OptBoolInt{ b: null, i: null };
    }
}