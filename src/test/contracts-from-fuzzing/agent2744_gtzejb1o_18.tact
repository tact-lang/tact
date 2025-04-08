struct OptionalString {
    text: String?;
}

contract ContractOptStr {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            text: "hello"
        };
    }
}
