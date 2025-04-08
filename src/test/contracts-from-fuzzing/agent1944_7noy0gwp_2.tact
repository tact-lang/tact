struct Complex {
    i1: Int;
    b1: Bool;
    str: String;
    s1: Slice;
    c1: Cell;
    addr: Address;
    flag: Bool;
}

contract AllTypesTest {
    data: Complex;

    init() {
        self.data = Complex{
            i1: 1,
            b1: true,
            str: "test",
            s1: emptyCell().asSlice(),
            c1: emptyCell(),
            addr: myAddress(),
            flag: false,
        };
    }
}