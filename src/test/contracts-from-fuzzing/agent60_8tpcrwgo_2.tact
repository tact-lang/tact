struct NestedOpt {
    first: Int?;
    second: Bool?;
    third: Cell?;
}

contract OptionalFields {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            first: null,
            second: true,
            third: null,
        };
    }
}