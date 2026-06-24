struct NestedOptDefault {
    foo: Int? = null;
}

contract OptionFieldWithDefault {
    value: NestedOptDefault;

    init() {
        self.value = NestedOptDefault{};
    }
}