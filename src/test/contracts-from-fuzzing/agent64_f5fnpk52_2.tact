struct NestedOptional {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptionalNestedTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: 2,
            c: null
        };
    }

    receive() {
        self.data = NestedOptional{
            a: 1,
            b: null,
            c: 3
        };
    }
}