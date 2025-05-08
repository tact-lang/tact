struct NestedOptional {
    inner: Int?;
    data: Bool;
}

contract NestedOptionalTest {
    field: NestedOptional;

    init() {
        self.field = NestedOptional {
            inner: null,
            data: true,
        };
    }
}