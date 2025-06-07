struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Cell;
    g: Address;
    h: Slice;
}

contract StorageTest {
    testField: Complex;

    init() {
        self.testField = Complex{
            a: 123,
            b: false,
            c: null,
            d: true,
            e: "abc",
            f: emptyCell(),
            g: myAddress(),
            h: emptyCell().asSlice(),
        };
    }
}