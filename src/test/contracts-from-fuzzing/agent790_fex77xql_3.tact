struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract WideContract {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            a: 1,
            b: false,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "test"
        };
    }
}