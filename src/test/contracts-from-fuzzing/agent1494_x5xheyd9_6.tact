struct Complex {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: String;
    sl: Slice;
}

contract CombinedTypesTest {
    data: Complex;

    init() {
        self.data = Complex{
            i: 1,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: "test",
            sl: emptyCell().asSlice(),
        };
    }
}
