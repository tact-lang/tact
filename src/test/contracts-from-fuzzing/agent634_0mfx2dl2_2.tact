struct ManyFields {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: String?;
    j: Bool?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Builder?;
}

contract TestContract {
    s: ManyFields;
    
    init() {
        self.s = ManyFields{
            a: 1, b: "str", c: true, d: myAddress(), e: emptyCell(), f: emptyCell().asSlice(), g: beginCell(),
            h: 1, i: "opt", j: false, k: null, l: null, m: null, n: null
        };
    }
}
