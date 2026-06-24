struct SText {
    s: String;
}

struct SCell {
    c: Cell;
}

contract MixedStructs {
    st: SText;
    sc: SCell;

    init() {
        self.st = SText{ s: "hi" };
        self.sc = SCell{ c: emptyCell() };
    }
}