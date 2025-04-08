struct OptCell {
    a: Cell?;
    b: Int;
}

contract OptCellTest {
    data: OptCell;

    init() {
        self.data = OptCell{
            a: null,
            b: 5
        };
    }
}