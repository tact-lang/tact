struct Param {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
}

contract TestOptionalStruct {
    param: Param;

    init() {
        self.param = Param{
            intVal: 7,
            boolVal: true,
            addrVal: myAddress(),
            strVal: "x",
            optInt: null,
            optBool: null,
            optAddr: null,
            optStr: null,
        };
    }
}