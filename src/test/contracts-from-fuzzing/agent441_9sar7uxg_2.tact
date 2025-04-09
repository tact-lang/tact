struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract TestContract {
    record: Complex;

    init() {
        self.record = Complex{
            a: 0,
            b: false,
            c: "",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}