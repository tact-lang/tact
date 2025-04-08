struct MultiType {
    i: Int;
    bl: Bool;
    addr: Address;
    s: String;
    c: Cell;
}

contract Mix {
    data: MultiType;

    init() {
        self.data = MultiType{
            i: 7,
            bl: true,
            addr: myAddress(),
            s: "str",
            c: emptyCell()
        };
    }
}