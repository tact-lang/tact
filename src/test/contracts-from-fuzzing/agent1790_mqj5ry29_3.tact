struct ManyPrimitives {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;
}

contract PrimitivesTest {
    value: ManyPrimitives;

    init() {
        self.value = ManyPrimitives{
            i: 10,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "test"
        };
    }
}
