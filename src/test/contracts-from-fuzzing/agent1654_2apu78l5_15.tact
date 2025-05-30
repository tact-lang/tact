struct Inner {
    i: Int;
}

struct OuterOpt {
    inner: Inner?;
}

contract TestContract {
    st: OuterOpt;
    init() {
        self.st = OuterOpt{ inner: null };
    }
}