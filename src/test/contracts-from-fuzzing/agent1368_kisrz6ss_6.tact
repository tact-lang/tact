struct ManyFields {
    a: Int = 1;
    b: Bool = false;
    c: Address?;
    d: String = "x";
    e: Cell?;
    f: Slice?;
    g: Int?;
    h: Bool?;
}

contract TestContract {
    mf: ManyFields = ManyFields{c: null, e: null, f: null, g: null, h: null};
    init() {}
    receive() {}
}