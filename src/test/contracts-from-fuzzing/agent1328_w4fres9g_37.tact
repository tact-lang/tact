// test optional field with default assigned to null explicitly
contract OptExplicitDefault {
    field: Int? = null;
    init() {
        self.field = null;
    }
}