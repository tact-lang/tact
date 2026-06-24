struct OptionalString {
    s: String?;
}

contract ContractOptStr {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            s: null
        };
    }
}