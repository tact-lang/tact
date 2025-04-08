struct Mix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
}

contract MixAll {
    data: Mix;
    init() {
        self.data = Mix{
            intVal: 1,
            boolVal: true,
            strVal: "test",
            addrVal: myAddress(),
            optInt: null,
            optBool: null,
            optStr: null,
            optAddr: null
        };
    }
}