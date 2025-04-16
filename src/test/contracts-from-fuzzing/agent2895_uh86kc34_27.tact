struct WideSet {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Address;
    x5: Cell;
    x6: Slice;
    x7: Builder;
}

contract WideStructField {
    val: WideSet;

    init() {
        self.val = WideSet{
            x1: 1,
            x2: true,
            x3: "hi",
            x4: myAddress(),
            x5: emptyCell(),
            x6: emptyCell().asSlice(),
            x7: beginCell()
        };
    }
}
