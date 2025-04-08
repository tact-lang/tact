struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: String?;
    i: Address?;
    j: Int?;
    k: Cell?;
    l: Slice?;
}

contract WideFields {
    store: Deep;

    init() {
        self.store = Deep{
            a:1, b:true, c:"c", d:emptyCell(), e:emptyCell().asSlice(),
            f:myAddress(), g:null, h:null, i:null, j:null, k:null, l:null
        };
    }
}