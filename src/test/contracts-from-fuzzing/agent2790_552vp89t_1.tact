struct S1 {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    flag: Bool?;
}

contract Test {
    data: S1;

    init() {
        self.data = S1{
            i: 1,
            b: true,
            s: "abc",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            flag: null
        };
    }
}