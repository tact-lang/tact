struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract PrimitivesStorage {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "hello"
        };
    }

    receive() {
        let _ = self.data;
    }
}