struct SOpt {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract OptionalFields {
    s: SOpt;

    init() {
        self.s = SOpt{
            optInt:null,
            optBool:null,
            optStr:null
        };
    }
}