// test a struct with nested optional struct field AND optional of that struct
struct WithNestedOpt {
    foo: Int;
    b: Bool?;
}

struct WrapNestedOpt {
    inner: WithNestedOpt?;
}

contract OptionalOptionalTest {
    data: WrapNestedOpt?;
    init() {
        self.data = null;
    }
}