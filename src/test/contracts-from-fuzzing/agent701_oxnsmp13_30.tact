struct NestedOptional {
    sub: Int?;
}

contract DefNestedNullable {
    field: NestedOptional? = null;

    init() {
        self.field = null;
    }
}