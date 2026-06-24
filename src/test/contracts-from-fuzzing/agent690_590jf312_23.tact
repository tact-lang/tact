struct Combo {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract MixedCombo {
    data: Combo;

    init() {
        self.data = Combo{
            a:1,
            b:null,
            c:"hi",
            d:null,
            e:true,
            f:false
        };
    }
}