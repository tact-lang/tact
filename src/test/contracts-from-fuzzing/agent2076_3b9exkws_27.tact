struct Various {
    s: Slice;
    b: Builder;
    cel: Cell;
    addr: Address;
    str: String;
    num: Int;
    flag: Bool;
}

contract Test {
    v: Various;

    init() {
        self.v = Various{
            s: emptyCell().asSlice(),
            b: beginCell(),
            cel: emptyCell(),
            addr: myAddress(),
            str: "x",
            num: 5,
            flag: true
        };
    }
}