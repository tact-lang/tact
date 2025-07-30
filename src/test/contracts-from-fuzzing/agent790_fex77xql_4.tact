struct OptionalFields {
    num: Int?;
    flag: Bool?;
    addr: Address?;
}

contract OptionalsContract {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{num: null, flag: null, addr: null};
    }
}