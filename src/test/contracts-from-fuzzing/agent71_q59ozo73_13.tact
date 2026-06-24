struct Complex {
    n: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
}

contract DiverseFields {
    data: Complex;
    init() {
        self.data = Complex{
            n: 1,
            b: true,
            s: "abc",
            c: emptyCell(),
            addr: myAddress()
        };
    }
}