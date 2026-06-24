struct N {
    a: String;
}

contract OptEmptyStr {
    opt: String?;
    n: N?;

    init() {
        self.opt = null;
        self.n = null;
    }

    receive() {}
}