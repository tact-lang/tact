struct C {
    a: Int;
    b: Bool;
    s: String;
    c: Cell;
    addr: Address;
}

contract ManyPrimitives {
    data: C;

    init() {
        self.data = C{
            a: 1,
            b: true,
            s: "x",
            c: emptyCell(),
            addr: myAddress()
        };
    }
}