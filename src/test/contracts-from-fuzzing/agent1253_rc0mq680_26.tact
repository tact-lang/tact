struct BuilderField {
    b: Builder;
}

contract BuilderFieldTest {
    val: BuilderField;

    init() {
        self.val = BuilderField{ b: beginCell() };
    }
}
