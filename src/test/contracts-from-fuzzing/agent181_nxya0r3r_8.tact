struct Combo {
    i: Int;
    b: Bool;
    s: String;
    addr: Address?;
    cl: Cell;
    sl: Slice;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract MixPersistent {
    combo: Combo;

    init() {
        self.combo = Combo{
            i:1, b:true, s:"hi", addr: null, cl: emptyCell(), sl: emptyCell().asSlice(), optInt:null, optStr:null, optBool:null
        };
    }
}