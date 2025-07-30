struct MultTypes {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    str: String;
    optStr: String?;
    addr: Address;
    optAddr: Address?;
}

contract MultiField {
    mf: MultTypes;

    init() {
        self.mf = MultTypes{
            intVal: 1,
            boolVal: true,
            optInt: null,
            str: "abc",
            optStr: null,
            addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
            optAddr: null
        };
    }
}
