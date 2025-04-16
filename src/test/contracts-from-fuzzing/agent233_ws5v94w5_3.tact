struct ManyFields {
    a: Int;
    b: Int;
    c: Bool;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool;
    h: String;
    i: Slice;
    j: Address;
    k: Int?;
    l: Bool?;
    m: Address?;
    n: String;
}

contract LotsOfFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1, b:2, c:true, d:emptyCell(), e:emptyCell().asSlice(),
            f:"hi", g:false, h:"bye", i:emptyCell().asSlice(), j:myAddress(),
            k:null, l:null, m:null, n:"last"
        };
    }
}
