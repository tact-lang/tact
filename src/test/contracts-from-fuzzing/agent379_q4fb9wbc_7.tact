struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestedStruct {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            innerOpt: Inner{ val: 7 }
        };
    }
}