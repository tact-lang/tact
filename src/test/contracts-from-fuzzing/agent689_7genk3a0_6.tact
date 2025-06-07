struct ComplexOptional {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    stringOpt: String?;
}

contract OptionalFields {
    data: ComplexOptional;
    init() {
        self.data = ComplexOptional{
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            stringOpt: null,
        };
    }
}