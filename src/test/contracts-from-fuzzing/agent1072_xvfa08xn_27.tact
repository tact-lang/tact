struct Multi {
    i: Int;
    s: String;
    b: Bool;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
}

contract AllTypes {
    val: Multi;
    init() {
        self.val = Multi{
            i: 5,
            s: "q",
            b: true,
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            a: myAddress()
        };
    }
}