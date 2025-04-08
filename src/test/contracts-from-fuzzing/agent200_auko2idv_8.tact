struct NestedOptional {
    inner: InnerOpt?;
    count: Int;
}

struct InnerOpt {
    value: Int;
    flag: Bool?;
}

contract OptionalNestedTest {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            inner: InnerOpt{value: 123, flag: null},
            count: 5
        };
    }
}