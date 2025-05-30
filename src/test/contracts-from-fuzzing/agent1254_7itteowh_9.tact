struct WideNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
}

contract ManyDifferentStructFields {
    state: WideNested;
    init() {
        self.state = WideNested{
            a: 5,
            b: false,
            c: "hi",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: emptyCell(),
        };
    }
}