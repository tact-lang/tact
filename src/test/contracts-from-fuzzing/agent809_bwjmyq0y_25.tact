struct MultiOptional {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract OptionalCombo {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            one: null,
            two: null,
            three: null
        };
    }
}