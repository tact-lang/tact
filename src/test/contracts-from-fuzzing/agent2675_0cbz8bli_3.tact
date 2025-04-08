struct DeepInner {
    val: Int = 42;
}

struct WithOptionalNested {
    nestedVal: DeepInner?;
}

contract OptionalNestedContract {
    data: WithOptionalNested;
    init() {
        self.data = WithOptionalNested{};
    }
}