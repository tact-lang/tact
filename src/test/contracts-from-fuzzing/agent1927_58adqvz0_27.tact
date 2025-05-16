struct OptionalInner {
    val: Int?;
}

contract NestedOptDefault {
    opt: OptionalInner = OptionalInner{ val: null };

    init() {
        self.opt = OptionalInner{ val: 55 };
    }
}