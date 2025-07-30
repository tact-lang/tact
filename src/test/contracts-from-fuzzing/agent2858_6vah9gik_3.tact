struct Complex {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: Address;
    f: String;
    g: Int?;
    h: Cell?;
    i: Slice?;
    j: Address?;
    k: String?;
    l: Bool?;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            a: 1,
            b: true,
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: myAddress(),
            f: "test",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}