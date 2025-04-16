struct OptionalNested {
    x: Int?;
    y: Bool?;
    inner: Inner?;
}

struct Inner {
    z: Int;
}

contract OptTest {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            x: null,
            y: null,
            inner: null
        };
    }
}