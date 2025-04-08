struct OptNested {
    nestedOpt: OptInner?;
}

struct OptInner {
    val: Int;
    b: Bool;
}

contract OptionalNestedStruct {
    data: OptNested;

    init() {
        self.data = OptNested {
            nestedOpt: OptInner { val: 10, b: false }
        };
    }
}