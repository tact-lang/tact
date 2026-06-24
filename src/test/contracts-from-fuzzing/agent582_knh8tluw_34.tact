struct RemainInside {
    bits: Int;
    rest: Cell as remaining;
}

contract RemainingCellTest {
    r: RemainInside;

    init() {
        self.r = RemainInside{
            bits: 5,
            rest: emptyCell()
        };
    }
}
