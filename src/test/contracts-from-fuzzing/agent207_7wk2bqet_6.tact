struct Mixed {
    i: Int;
    b: Bool;
    addr: Address;
    c: Cell;
    s: String;
    optI: Int?;
    optB: Bool?;
}

contract Test6 {
    mixedField: Mixed;
    init() {
        self.mixedField = Mixed{
            i: 42,
            b: true,
            addr: myAddress(),
            c: emptyCell(),
            s: "hi",
            optI: null,
            optB: false
        };
    }
}