struct Embedded {
    intValue: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract EmbeddedAll {
    storage: Embedded;

    init() {
        self.storage = Embedded{
            intValue:10, boolVal:true, strVal:"x",
            optInt:null, optBool:null, optStr:null
        };
    }
}