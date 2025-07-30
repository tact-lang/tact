struct InnerDefault {
    x: Int = 4;
    y: Bool = false;
}

struct OuterDefault {
    id: Int;
    inner: InnerDefault;
}

contract DefaultNestedTest {
    data: OuterDefault;

    init() {
        self.data = OuterDefault{
            id: 42,
            inner: InnerDefault{},
        };
    }
}