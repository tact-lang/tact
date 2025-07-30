struct Complex {
    a: Int;
    b: Bool?;
    c: Slice;
    d: String;
    e: String?;
    f: Address;
    g: Cell;
    h: Int?;
}

contract TestContract {
    val: Complex;

    init() {
        self.val = Complex{
            a: 0,
            b: null,
            c: emptyCell().asSlice(),
            d: "hello",
            e: null,
            f: myAddress(),
            g: emptyCell(),
            h: 42
        };
    }
}