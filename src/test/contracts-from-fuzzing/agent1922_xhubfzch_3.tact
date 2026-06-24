struct OptionalNested {
    inner: Inner?;
}

struct Inner {
    value: Int?;
}

contract OptionalTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            inner: null
        };
    }
}