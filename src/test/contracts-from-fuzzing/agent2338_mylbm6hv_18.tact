struct OptionalCellContract {
    cellOpt: Cell?;
}

contract OptionCellTest {
    d: OptionalCellContract;

    init() {
        self.d = OptionalCellContract{ cellOpt: emptyCell() };
    }
}