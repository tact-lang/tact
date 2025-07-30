struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    builder: Builder;
}

contract ComplexTypes {
    val: Mixed;

    init() {
        self.val = Mixed{
            i: 42,
            b: true,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            addr: myAddress(),
            builder: beginCell()
        };
    }
}