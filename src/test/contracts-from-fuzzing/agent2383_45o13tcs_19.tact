struct Flat {
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

contract FlatContract {
    f: Flat;
    init() {
        self.f = Flat {
            a:0, b:true, c:"", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
            g:null, h:null, i:null, j:null, k:null, l:null
        };
    }
}