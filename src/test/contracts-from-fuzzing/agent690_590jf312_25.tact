struct ComplexMany {
    a: Int;
    b: String;
    c: Cell;
    d: Slice;
    e: Address;
    f: Int?;
    g: String?;
    h: Cell?;
    i: Slice?;
    j: Address?;
    k: Bool;
    l: Bool?;
}

contract ComplexStore {
    s: ComplexMany;

    init() {
        self.s = ComplexMany{
            a:1,
            b:"s",
            c:emptyCell(),
            d:emptyCell().asSlice(),
            e:myAddress(),
            f:2,
            g:"opt",
            h:null,
            i:null,
            j:null,
            k:true,
            l:false
        };
    }
}