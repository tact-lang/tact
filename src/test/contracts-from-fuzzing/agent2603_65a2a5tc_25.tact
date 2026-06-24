struct WrapInt {
    val: Int;
}

contract WrappedPrimitive {
    wrapper: WrapInt;
    init() {
        self.wrapper = WrapInt{ val: 777 };
    }
}
