struct Mix {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
}

contract Test12 {
    m: Mix;

    init() {
        self.m = Mix{
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            strField: "abc",
            optInt: null,
            optBool: null,
            optAddr: null,
            optStr: null
        };
    }
}