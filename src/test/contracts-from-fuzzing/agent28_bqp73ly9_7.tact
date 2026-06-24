struct OptionalNested {
    sub: Nested?;
}
struct Nested {
    value: Int;
}

contract OptionalNestedStructTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            sub: null
        };
    }
}