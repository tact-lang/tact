struct NestedOptional {
    foo: Int?;
}

contract OptOptTest {
    data: NestedOptional?;

    init() {
        self.data = null;
    }
}