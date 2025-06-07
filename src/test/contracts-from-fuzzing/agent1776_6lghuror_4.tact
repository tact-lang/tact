struct ManyPrim {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract TestContract {
    data: ManyPrim;

    init() {
        self.data = ManyPrim{
            a: 42,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "world"
        };
    }

    receive() {
        let _ = self.data.f;
    }
}