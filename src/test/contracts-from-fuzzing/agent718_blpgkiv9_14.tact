struct DefaultOptionalNested {
    nested: Int? = null;
}

contract DefaultOptionalNestedContract {
    val: DefaultOptionalNested;
    init() {
        self.val = DefaultOptionalNested{};
    }
}