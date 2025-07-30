struct WrapBool {
    flag: Bool;
}

contract OptionalWrapBool {
    prop: WrapBool?;

    init() {
        self.prop = null;
    }
}