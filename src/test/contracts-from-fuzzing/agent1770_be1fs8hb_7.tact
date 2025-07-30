struct PrimitivesMixed {
    x: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
}

contract PrimitiveVars {
    stuff: PrimitivesMixed;

    init() {
        self.stuff = PrimitivesMixed{
            x: 1,
            b: true,
            s: "hi",
            c: emptyCell(),
            addr: myAddress(),
        };
    }
}