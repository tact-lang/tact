struct WrappedInt {
    value: Int = 123;
}

struct WrapperOuter {
    inner: WrappedInt?;
}

contract Test {
    storage: WrapperOuter = WrapperOuter{ inner: WrappedInt{ value: 999 } };
    init() {}
}