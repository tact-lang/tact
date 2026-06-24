struct OptionalStruct {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{ innerOpt: null };
    }
}