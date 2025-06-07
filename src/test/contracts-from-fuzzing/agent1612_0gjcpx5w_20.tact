struct StringAndOptional {
    a: String?;
}

contract OptionalString {
    data: StringAndOptional;

    init() {
        self.data = StringAndOptional{
            a: null,
        };
    }
}
