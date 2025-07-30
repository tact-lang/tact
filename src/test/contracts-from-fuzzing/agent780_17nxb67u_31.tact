struct WrappedPrimitive {
    num: Int = 42;
}

contract WrapperContract {
    field: WrappedPrimitive;

    init() {
        self.field = WrappedPrimitive{};
    }
}