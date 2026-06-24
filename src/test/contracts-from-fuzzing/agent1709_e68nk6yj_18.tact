struct Complex {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Slice;
}

contract MixedData {
    val: Complex;
    init() {
        self.val = Complex{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "abc",
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: emptyCell().asSlice(),
        };
    }
}