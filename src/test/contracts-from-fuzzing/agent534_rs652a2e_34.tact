struct OptionalCellWrap {
    cellO: Cell?;
}

contract OptCellWrapTest {
    wrapper: OptionalCellWrap;

    init() {
        self.wrapper = OptionalCellWrap{
            cellO: null
        };
    }
}