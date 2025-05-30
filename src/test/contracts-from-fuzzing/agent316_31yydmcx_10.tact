struct Mixed {
    intVal: Int;
    intOpt: Int?;
    boolVal: Bool;
    boolOpt: Bool?;
    addrVal: Address;
    addrOpt: Address?;
    strVal: String;
    strOpt: String?;
}

contract WithMixed {
    data: Mixed;

    init() {
        self.data = Mixed{
            intVal: 1,
            intOpt: null,
            boolVal: true,
            boolOpt: false,
            addrVal: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            addrOpt: null,
            strVal: "hi",
            strOpt: null
        };
    }
}