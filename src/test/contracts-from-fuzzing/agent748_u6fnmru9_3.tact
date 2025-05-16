struct NestedOpt {
    opt1: Inner?;
}

struct Inner {
    s: String;
    b: Bool;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt {
            opt1: null
        };
    }
}