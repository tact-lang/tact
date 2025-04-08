struct AllPrimitives {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
}

contract TestContract {
    data: AllPrimitives;

    init() {
        self.data = AllPrimitives{
            i: 0,
            b: false,
            a: myAddress(),
            s: "",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
        };
    }
}