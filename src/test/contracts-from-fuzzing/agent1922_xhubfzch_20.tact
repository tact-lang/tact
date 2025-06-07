struct StringOptional {
    text: String?;
}

contract OptionalStrField {
    s: StringOptional;

    init() {
        self.s = StringOptional{
            text: null
        };
    }
}