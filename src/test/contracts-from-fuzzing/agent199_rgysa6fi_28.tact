struct VariousPrimitives {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
}

contract VariousPrimitivesContract {
    values: VariousPrimitives;

    init() {
        self.values = VariousPrimitives{
            i: 7,
            b: true,
            s: "abc",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress(),
        };
    }
}
