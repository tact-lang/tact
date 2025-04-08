struct Inner {
    flag: Bool;
}

contract OptStruct {
    s: Inner?;

    init() {
        self.s = null;
    }
}