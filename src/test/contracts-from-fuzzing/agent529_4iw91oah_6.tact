struct OptionalFields {
    name: String?;
    flag: Bool?;
    addr: Address?;
    big: Int?;
}

contract OptHolder {
    opts: OptionalFields;

    init() {
        self.opts = OptionalFields{
            name: null, flag: null, addr: null, big: null
        };
    }
}