struct OptionalCell {
    data: Cell?;
}

contract OptCellTest {
    f: OptionalCell;

    init() {
        self.f = OptionalCell{ data: null };
    }
}
