struct OptionalStruct {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract OptStruct {
    field: OptionalStruct;
    init() {
        self.field = OptionalStruct{innerOpt: null};
    }
}