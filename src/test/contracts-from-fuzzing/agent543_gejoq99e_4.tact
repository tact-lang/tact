struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: Address;
    f: String;
}

contract ManyPrimitivesContract {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            a: 1,
            b: true,
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: myAddress(),
            f: "test"
        };
    }
}
