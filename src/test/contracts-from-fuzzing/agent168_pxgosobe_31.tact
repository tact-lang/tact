struct UnusuallyOrdered {
    b: Bool;
    x: Int as uint32;
    s: String;
    addr: Address;
    slice: Slice;
    cell: Cell;
    builder: Builder;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optString: String?;
}

contract TestUnusualOrdering {
    f: UnusuallyOrdered;

    init() {
        self.f = UnusuallyOrdered{
            b: true,
            x: 123,
            s: "a",
            addr: myAddress(),
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            builder: beginCell(),
            optInt: null,
            optBool: null,
            optAddr: null,
            optString: null,
        };
    }
}