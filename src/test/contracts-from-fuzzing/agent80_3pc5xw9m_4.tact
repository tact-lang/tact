struct OptionalNested {
    opt_inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestedStruct {
    data: OptionalNested;
    init() {
        self.data = OptionalNested{
            opt_inner: Inner{ val: 7 }
        };
    }
}