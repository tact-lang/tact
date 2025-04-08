struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell;
    e: Slice;
    f: Address?;
    g: Int?;
}

contract VarietyTest {
    mixed: Complex;

    init() {
        self.mixed = Complex{
            a: 1,
            b: null,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: null,
            g: null
        };
    }
}