struct VariousPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract PrimitiveMix {
    data: VariousPrimitives;

    init() {
        self.data = VariousPrimitives{
            a: 1,
            b: true,
            c: "text",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}