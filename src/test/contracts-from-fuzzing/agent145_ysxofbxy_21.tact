struct OptionalNestedStr {
    s: String?;
    n: Int?;
}

contract OptionalsInside {
    data: OptionalNestedStr;

    init() {
        self.data = OptionalNestedStr {
            s: null, n: null
        };
    }
}