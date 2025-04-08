struct OptionWrap {
    val: Int?;
}

struct Container {
    inner: OptionWrap?;
}

contract OptNestedTest {
    field: Container;

    init() {
        self.field = Container{
            inner: null,
        };
    }
}