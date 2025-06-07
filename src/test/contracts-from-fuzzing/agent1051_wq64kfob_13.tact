struct OptionalStructs {
    s1: String?;
    s2: String?;
    b: Bool?;
    i: Int?;
    addr: Address?;
}

contract OptionalStructFields {
    data: OptionalStructs;

    init() {
        self.data = OptionalStructs{
            s1: null,
            s2: null,
            b: null,
            i: null,
            addr: null
        };
    }
}