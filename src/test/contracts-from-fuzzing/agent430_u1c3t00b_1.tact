struct OptionalOnly {
    first: Int?;
    second: Bool?;
    third: String?;
}

contract Test {
    data: OptionalOnly;

    init() {
        self.data = OptionalOnly{
            first: null,
            second: null,
            third: null,
        };
    }
}