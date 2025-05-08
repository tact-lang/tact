struct Inner {
    innerVal: Int;
}

struct Wrapper {
    nestedOpt: Inner?;
    flag: Bool;
}

contract TestContract {
    field: Wrapper;

    init() {
        self.field = Wrapper{ nestedOpt: null, flag: true };
    }
}