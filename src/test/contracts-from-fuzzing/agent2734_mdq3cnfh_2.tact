struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
}

contract TestContract {
    myData: Complex;

    init() {
        self.myData = Complex{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: "world",
            i: null,
            j: null,
        };
    }
}
