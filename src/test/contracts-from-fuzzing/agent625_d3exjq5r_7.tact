struct LongList {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: Cell;
    f7: Slice;
    f8: Int;
    f9: Bool;
    f10: String;
}

contract Test {
    data: LongList;

    init() {
        self.data = LongList {
            f1: 1,
            f2: 2,
            f3: true,
            f4: false,
            f5: "a",
            f6: emptyCell(),
            f7: emptyCell().asSlice(),
            f8: 8,
            f9: true,
            f10: "b"
        };
    }
}