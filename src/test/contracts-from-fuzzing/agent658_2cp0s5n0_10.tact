struct Composite {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    addr: Address;
    cell: Cell;
}

contract DirectFields {
    i: Int;
    opt: Int?;
    nested: Composite;

    init() {
        self.i = 5;
        self.opt = null;
        self.nested = Composite{
            i: 42,
            b: false,
            s: "hi",
            o: 17,
            addr: myAddress(),
            cell: emptyCell()
        };
    }
}