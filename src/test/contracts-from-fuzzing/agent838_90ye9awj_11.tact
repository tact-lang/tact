struct OptionalStruct {
    a: Inner?;
}

struct Inner {
    b: Int;
    c: Bool;
}

contract TestContract {
    opt: OptionalStruct;
    init() {
        self.opt = OptionalStruct{ a: null };
    }
}