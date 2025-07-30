struct ContainCell {
    c: Cell;
}

struct Outer {
    inner: ContainCell;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: ContainCell { c: emptyCell() }
        };
    }
}