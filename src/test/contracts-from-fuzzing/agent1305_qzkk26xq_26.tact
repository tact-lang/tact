struct EmptyOptionalTest {
    emptyField: Cell? = null;
}

contract ContractWithOptional {
    field: EmptyOptionalTest;

    init() {
        self.field = EmptyOptionalTest{};
    }
}