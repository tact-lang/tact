struct WrapNestedOptionals {
    x: Int?;
    y: Bool?;
    inner: Nested?;
}

struct Nested {
    a: Int?;
    b: Bool?;
}

contract WrapNestedOptionalsTest {
    val: WrapNestedOptionals;
    init() {
        self.val = WrapNestedOptionals{};
    }
}