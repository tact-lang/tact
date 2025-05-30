struct StrBoolInt {
    s: String;
    b: Bool;
    i: Int;
}

contract MixOrder {
    a: StrBoolInt;
    b: StrBoolInt;

    init() {
        self.a = StrBoolInt{ s:"hi", b:true, i:1 };
        self.b = StrBoolInt{ s:"bye", b:false, i:2 };
    }
}