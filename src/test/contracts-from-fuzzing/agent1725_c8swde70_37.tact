struct BigCombo {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Bool;
    f: Bool?;
    g: String;
    h: String?;
}

contract ComboUsage {
    big: BigCombo;

    init() {
        self.big = BigCombo{
            a:1,b:2,c:3,d:4,e:true,f:null,g:"hi",h:null
        };
    }
}