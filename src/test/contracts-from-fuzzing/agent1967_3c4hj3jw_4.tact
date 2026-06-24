struct Complex {
    x: Int;
    y: Bool;
    z: String;
    a: Cell;
    b: Slice;
    c: Builder;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Cell?;
    i: Slice?;
    j: Builder?;
    k: Address?;
}

contract TestContract {
    complexField: Complex;

    init() {
        self.complexField = Complex{
            x: 1,
            y: true,
            z: "hello",
            a: emptyCell(),
            b: emptyCell().asSlice(),
            c: beginCell(),
            d: myAddress(),
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
        };
    }
}