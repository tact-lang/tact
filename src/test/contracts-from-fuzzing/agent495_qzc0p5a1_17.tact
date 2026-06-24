struct OptionalCell {
    foo: Cell?;
}

contract OptCellContract {
    container: OptionalCell;

    init() {
        self.container = OptionalCell{ foo: null };
    }
}