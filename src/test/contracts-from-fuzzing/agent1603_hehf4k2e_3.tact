struct OptionalFields {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;
}

contract ContractWithOptionals {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{ opt1: null, opt2: true, opt3: null };
    }
}