struct OptionalCellHolder {
    maybe: Cell?;
}

contract OptCellTest {
    data: OptionalCellHolder;

    init() {
        self.data = OptionalCellHolder{
            maybe: null
        };
    }
}