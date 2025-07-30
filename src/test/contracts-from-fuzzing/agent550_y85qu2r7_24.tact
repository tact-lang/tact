struct TailCell {
    a: Int;
    b: Cell as remaining;
}

contract CellRemain {
    val: TailCell;

    init() {
        self.val = TailCell{
            a: 42,
            b: emptyCell()
        };
    }
}