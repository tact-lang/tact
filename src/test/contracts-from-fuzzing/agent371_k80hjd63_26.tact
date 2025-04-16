struct StringVsCell {
    s: String;
    c: Cell;
}
contract TestContract {
    f: StringVsCell;
    init() {
        self.f = StringVsCell{ s: "abc", c: emptyCell() };
    }
}
