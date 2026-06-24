struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}
contract TestContract {
    combo: Combo;
    init() {
        self.combo = Combo{
            a:1, b:true, c:"hi", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
            g:null, h:null, i:null, j:null, k:null, l:null
        };
    }
}