struct Combo2 {
    aa: Int;
    bb: Int?;
    cc: Bool;
    dd: Bool?;
    ee: String;
    ff: String?;
}

contract ComplexCombo {
    val: Combo2 = Combo2{
        aa: 1,
        bb: null,
        cc: true,
        dd: null,
        ee: "hi",
        ff: null
    };

    init() {
        self.val = Combo2{
            aa: 2,
            bb: 22,
            cc: false,
            dd: true,
            ee: "hello",
            ff: "world"
        };
    }
}