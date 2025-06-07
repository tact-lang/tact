struct SWithMany {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
}

contract BigPrimitiveMix {
    val: SWithMany;

    init() {
        self.val = SWithMany {
            a: 7,
            b: true,
            c: "string",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress()
        };
    }

    receive() {
        let _ = self.val.a;
    }
}