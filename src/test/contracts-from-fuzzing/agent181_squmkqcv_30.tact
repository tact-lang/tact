struct OptionalCellHolder {
    inner: Cell?;
}

contract CellOptTest {
    v: OptionalCellHolder;

    init() {
        self.v = OptionalCellHolder{
            inner: null
        };
    }
}
