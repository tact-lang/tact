struct Rec {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Builder;
    g: Slice;
}

contract AllPrim {
    val: Rec;

    init() {
        self.val = Rec{
            a: 1,
            b: false,
            c: "xxx",
            d: myAddress(),
            e: emptyCell(),
            f: beginCell(),
            g: emptyCell().asSlice(),
        };
    }
}