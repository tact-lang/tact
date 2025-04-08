struct Cells {
    c: Cell? = null;
    s: Slice? = null;
}

contract TestC {
    data: Cells;

    init() {
        self.data = Cells{};
    }
}