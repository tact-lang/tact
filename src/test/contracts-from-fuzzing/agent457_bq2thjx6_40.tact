struct HasString {
    s: String;
}

struct MultiNested {
    i1: Int;
    s1: String;
    inner: HasString;
    addr1: Address;
    c1: Cell;
    sl1: Slice;
    opti: Int?;
    opts: String?;
    optaddr: Address?;
}

contract Heavy {
    big: MultiNested;
    init() {
        self.big = MultiNested{
            i1:1,s1:"hi",
            inner:HasString{ s:"x" },
            addr1:myAddress(),c1:emptyCell(),sl1:emptyCell().asSlice(),
            opti:null,opts:null,optaddr:null
        };
    }
}