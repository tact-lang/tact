struct BigNested {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract ManyOptionKinds {
    val: BigNested;
    init() {
        self.val = BigNested{
            a: 1,
            b: "b",
            c: true,
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}