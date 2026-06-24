struct WeirdOrder {
    str: String;
    intBefore: Int;
    optStr: String?;
    boolAfter: Bool;
    optBool: Bool?;
    lastInt: Int;
}

contract OrderTest {
    d: WeirdOrder;

    init() {
        self.d = WeirdOrder{
            str:"hi",
            intBefore:1,
            optStr:null,
            boolAfter:true,
            optBool:null,
            lastInt:42,
        };
    }
}
