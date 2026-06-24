struct Mix {
    intVal: Int;
    optInt: Int?;
    boolVal: Bool;
    optBool: Bool?;
    strVal: String;
    optStr: String?;
    addrVal: Address;
}

contract TestContract {
    data: Mix;
    init() {
        self.data = Mix{
            intVal: 1,
            optInt: null,
            boolVal: false,
            optBool: null,
            strVal: "s",
            optStr: null,
            addrVal: myAddress()
        };
    }
}