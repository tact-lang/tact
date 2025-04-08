struct Combo {
    aaa: Int;
    bbb: Bool;
    ccc: String;
    ddd: Int?;
    eee: Bool?;
    fff: String?;
}

contract MixCombo {
    one: Combo;
    two: Combo;

    init() {
        self.one = Combo{
            aaa:1, bbb:true, ccc:"hi", ddd:null, eee:null, fff:null
        };
        self.two = Combo{
            aaa:2, bbb:false, ccc:"yo", ddd:3, eee:true, fff:"zzz"
        };
    }
}