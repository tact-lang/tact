struct Complex {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Cell;
    f: Slice;
    g: Address;
    h: String?;
    i: Bool?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract ManyOptionals {
    field: Complex;
    init() {
        self.field = Complex{
            a: 1,
            b: null,
            c: true,
            d: "hello",
            e: emptyCell(),
            f: emptySlice(),
            g: myAddress(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}