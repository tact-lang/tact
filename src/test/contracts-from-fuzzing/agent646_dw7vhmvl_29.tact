struct DefaultsNested {
    inner: DefaultsInner;
}

struct DefaultsInner {
    foo: Int = 42;
    bar: Bool?;
}

contract DefaultsNestedTest {
    data: DefaultsNested;

    init() {
        self.data = DefaultsNested{
            inner: DefaultsInner{}
        };
    }
}