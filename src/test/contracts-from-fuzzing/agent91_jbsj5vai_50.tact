// Try optional boolean nested
struct OptionalBoolNested {
    opt: OptInner?;
}

struct OptInner {
    val: Bool?;
}

contract OptBoolNestedTest {
    data: OptionalBoolNested;

    init() {
        self.data = OptionalBoolNested{
            opt: OptInner{ val: null }
        };
    }
}
