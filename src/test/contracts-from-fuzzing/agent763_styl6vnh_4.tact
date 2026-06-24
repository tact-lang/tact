struct OptionalNested {
    base: Int;
    nested: Inner?;
}

struct Inner {
    val1: Int;
    val2: Bool?;
}

contract OptionalNestTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            base: 7,
            nested: null
        };
    }
}