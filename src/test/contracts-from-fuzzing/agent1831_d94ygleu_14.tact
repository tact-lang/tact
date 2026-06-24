struct OptionalRec {
    inner: Inner?;
}

struct Inner {
    s: String;
}

contract TestContract {
    opt: OptionalRec?;

    init() {
        self.opt = null;
    }
}