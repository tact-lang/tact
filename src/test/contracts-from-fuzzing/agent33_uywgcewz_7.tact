struct StringAndOptionals {
    text: String;
    maybeText: String?;
    maybeInt: Int?;
    maybeAddress: Address?;
}

contract TestContract {
    content: StringAndOptionals;

    init() {
        self.content = StringAndOptionals{
            text: "Hello",
            maybeText: null,
            maybeInt: null,
            maybeAddress: null,
        };
    }
}