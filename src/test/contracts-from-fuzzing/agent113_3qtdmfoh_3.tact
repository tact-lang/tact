struct Complex {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    opti: Int?;
    optb: Bool?;
    optaddr: Address?;
}

contract ManyTypes {
    data: Complex;

    init() {
        self.data = Complex{
            i: 1,
            b: true,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            opti: null,
            optb: false,
            optaddr: null,
        };
    }

    receive() {
        self.data = Complex{
            i: 2,
            b: false,
            s: "world",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            opti: 5,
            optb: null,
            optaddr: myAddress(),
        };
    }
}
