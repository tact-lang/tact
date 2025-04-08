struct NestedOptional {
    innerField: Int?;
}

contract OptionalNestedTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            innerField: null
        };
    }
}
