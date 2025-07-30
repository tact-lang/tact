struct OptionalNested {
    nested: Inner?;
}

struct Inner {
    val1: Int;
    val2: Bool?;
    val3: String?;
}

contract OptionalNestedTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: Inner{
                val1: 7,
                val2: null,
                val3: "hello"
            }
        };
    }
}