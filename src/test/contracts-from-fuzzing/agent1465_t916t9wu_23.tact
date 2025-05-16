struct Combo {
    a: Int as uint8;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Slice;
    j: Slice?;
    k: Cell;
    l: Cell?;
}

contract MixTest {
    s: Combo;

    init() {
        self.s = Combo{
            a: 5, b:true, c:null, d:null, e:myAddress(), f:null, g:"hi", h:null,
            i:emptyCell().asSlice(), j:null, k:emptyCell(), l:null
        };
    }
}