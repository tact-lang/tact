struct LongFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Cell;
    j: Slice;
    k: Cell?;
    l: Slice?;
}

contract Store {
    store: LongFields;
    init() {
        self.store = LongFields{
            a:1, b:true, c:"abc", d:myAddress(), e:null, f:null, g:null, h:null,
            i:emptyCell(), j:emptyCell().asSlice(), k:null, l:null
        };
    }
}