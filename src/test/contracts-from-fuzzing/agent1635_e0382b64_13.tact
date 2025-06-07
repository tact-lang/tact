struct Inner {
    flag: Bool;
}

contract OptNestedOpt {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}
