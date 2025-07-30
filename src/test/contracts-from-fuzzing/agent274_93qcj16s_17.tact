struct VariousPrims {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    sl: Slice;
    cl: Cell;
}

contract ManyPrimTypesTest {
    field: VariousPrims;

    init() {
        self.field = VariousPrims{
            i: 77,
            b: true,
            s: "hello",
            a: myAddress(),
            sl: emptyCell().asSlice(),
            cl: emptyCell(),
        };
    }
}