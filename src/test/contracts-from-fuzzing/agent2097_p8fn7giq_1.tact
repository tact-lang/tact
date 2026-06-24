struct Inner {
    alpha: Int;
    beta: Int?;
}

contract NestedOptionalTest {
    field: Inner;

    init() {
        self.field = Inner{
            alpha: 1,
            beta: null
        };
    }
}