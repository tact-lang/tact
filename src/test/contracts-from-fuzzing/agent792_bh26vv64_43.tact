struct Inner {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract TestC {
    opt: Inner?;

    init() {
        self.opt = Inner{};
    }
}