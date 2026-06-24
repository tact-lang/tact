struct BigNestedOpt {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    addr: Address?;
    slice: Slice?;
}

contract OptAssign {
    big: BigNestedOpt;

    init() {
        self.big = BigNestedOpt{
            i: null,
            b: null,
            s: null,
            c: null,
            addr: null,
            slice: null,
        };
    }
}