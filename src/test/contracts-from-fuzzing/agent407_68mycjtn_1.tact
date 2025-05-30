struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract TestContract {
    s: LargeStruct;
    init() {
        self.s = LargeStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: "hi",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}
