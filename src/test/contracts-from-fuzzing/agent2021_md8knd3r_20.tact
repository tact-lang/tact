struct OptionalCellDefault {
    c: Cell? = null;
}

contract OptionalCellDefaultTest {
    state: OptionalCellDefault;

    init() {
        self.state = OptionalCellDefault{};
    }
}
