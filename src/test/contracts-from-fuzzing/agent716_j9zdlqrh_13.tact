struct Basic {
    intf: Int;
    boolf: Bool;
    optInt: Int?;
    optBool: Bool?;
    strf: String;
    optStr: String?;
}

contract BasicStructTest {
    st: Basic;

    init() {
        self.st = Basic{
            intf:123,
            boolf:true,
            optInt:null,
            optBool:null,
            strf:"abc",
            optStr:null
        };
    }
}