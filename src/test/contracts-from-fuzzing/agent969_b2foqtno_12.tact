struct NestedOpt {
    a: Int?;
    b: Bool?;
}

contract OptionalStructAssigned {
    data: NestedOpt?;

    init() {
        self.data = NestedOpt{
            a: 123,
            b: null
        };
    }
}
