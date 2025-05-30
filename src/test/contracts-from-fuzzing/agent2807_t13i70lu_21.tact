struct MultiKind {
    s: String;
    b: Bool;
    i: Int;
    c: Cell;
}

contract MultiType {
    val: MultiKind;
    init() {
        self.val = MultiKind{ s: "test", b: true, i: 1, c: emptyCell() };
    }
}