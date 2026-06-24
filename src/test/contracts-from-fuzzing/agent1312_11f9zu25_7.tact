struct OptNested {
    inner: Int?;
    deeper: Nested?;
}

struct Nested {
    val: Int;
}

contract OptStructTest {
    data: OptNested;

    init() {
        self.data = OptNested{
            inner: null,
            deeper: Nested{ val: 42 }
        };
    }
}