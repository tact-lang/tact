struct OptionalString {
    text: String?;
}

contract SimpleOptionalStr {
    item: OptionalString;

    init() {
        self.item = OptionalString{
            text: null
        };
    }
}