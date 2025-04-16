struct Complex {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Cell;
    f: Slice;
    g: Address;
    h: Bool?;
    i: Int;
    j: String?;
}

contract ManyFields {
    store: Complex;
    
    init() {
        self.store = Complex{
            a: 1,
            b: null,
            c: true,
            d: "hello",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: myAddress(),
            h: false,
            i: -1,
            j: null
        };
    }
}
