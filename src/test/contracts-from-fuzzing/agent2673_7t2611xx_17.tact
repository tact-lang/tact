struct Big {
    a: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    slice: Slice;
    builder: Builder;
    optA: Int?;
    optB: Bool?;
    optS: String?;
    optAddr: Address?;
}

contract BigHolder {
    data: Big;

    init() {
        self.data = Big{
            a:1, b:true, s:"hi", addr:myAddress(), c:emptyCell(),
            slice:emptyCell().asSlice(), builder:beginCell(),
            optA:null, optB:null, optS:null, optAddr:null
        };
    }
}