struct Various {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    addr: Address;
}

contract BigMix {
    f: Various;
    init() {
        self.f = Various{i:1,b:true,s:"h",c:emptyCell(),sl:emptyCell().asSlice(),bu:beginCell(),addr:myAddress()};
    }
}