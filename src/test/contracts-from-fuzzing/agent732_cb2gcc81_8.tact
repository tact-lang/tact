struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Builder;
    h: Bool?;
    i: String?;
    j: Int?;
    k: Address?;
}

contract ComplexContract {
    state: Complex;
    
    init() {
        self.state = Complex{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: emptyCell(),
            g: beginCell(),
            h: false,
            i: null,
            j: null,
            k: null
        };
    }
}