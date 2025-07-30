struct NestedOptionalStruct {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestedContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            innerOpt: null
        };
    }
}
