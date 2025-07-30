struct DefaultOverlay {
    foo: Int = 1;
    bar: Int = 2;
    baz: Int? = null;
    nested: Nested?;
}

struct Nested {
    alpha: Int = 3;
    beta: Int? = null;
}

contract OverlayDefaultsTest {
    data: DefaultOverlay;

    init() {
        self.data = DefaultOverlay{
            nested: Nested{
                beta: 5
            }
        };
    }
}
