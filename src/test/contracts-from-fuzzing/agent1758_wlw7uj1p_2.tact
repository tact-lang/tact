struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
}

contract StorageTest {
    value: Complex;

    init() {
        self.value = Complex{
            a: 123,
            b: true,
            c: "hi",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
        };
    }
}