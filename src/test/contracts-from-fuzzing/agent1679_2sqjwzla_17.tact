struct OptStruct {
    intOpt: Int?;
    addrOpt: Address?;
    boolOpt: Bool?;
}

contract OptionalStructHolder {
    optS: OptStruct;

    init() {
        self.optS = OptStruct{
            intOpt: null,
            addrOpt: null,
            boolOpt: null
        };
    }
}