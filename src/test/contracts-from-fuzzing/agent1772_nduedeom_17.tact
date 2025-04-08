struct BigNested {
    s1: String;
    s2: String;
    i1: Int;
    b1: Bool;
    c1: Cell;
    addr: Address;
    optionalVal: Int?;
    builder: Builder;
    slice: Slice;
}

contract BigNestedStorage {
    z: BigNested;

    init() {
        self.z = BigNested{
            s1: "a",
            s2: "b",
            i1: 12,
            b1: true,
            c1: emptyCell(),
            addr: myAddress(),
            optionalVal: null,
            builder: beginCell(),
            slice: emptyCell().asSlice()
        };
    }
}