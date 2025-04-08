struct OptNested {
    inner: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    opt: OptNested;

    init() {
        self.opt = OptNested{ inner: null };
    }
}