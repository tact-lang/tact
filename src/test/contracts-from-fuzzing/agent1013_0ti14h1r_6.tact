struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
}

contract MixedTypes {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:1, b:true, c:"hi", d: emptyCell(), e: emptyCell().asSlice(), f: beginCell(), g: myAddress(), h:null, i:null, j:null
        };
    }
}
