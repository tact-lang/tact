struct Inner {
    a: Int? = null;
}

contract TestContract {
    f: Inner;
    init() {
        self.f = Inner{};
    }
}