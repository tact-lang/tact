struct OptionalEmpty {
    str: String?;
    flag: Bool?;
    num: Int?;
}

contract AllOptional {
    data: OptionalEmpty;

    init() {
        self.data = OptionalEmpty{
            str: null,
            flag: null,
            num: null
        };
    }
}