struct WrappedString {
    s: String;
}
struct WrappedSlice {
    s: Slice;
}
struct WrappedCell {
    s: Cell;
}

contract WrapTest {
    ws: WrappedString = WrappedString{s:"hi"};
    wsl: WrappedSlice;
    wc: WrappedCell;
    init() {
        self.wsl = WrappedSlice{s: emptyCell().asSlice()};
        self.wc = WrappedCell{s: emptyCell()};
    }
}