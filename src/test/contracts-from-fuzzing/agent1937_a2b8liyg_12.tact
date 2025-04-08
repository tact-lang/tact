struct Inner {
    flag: Bool;
}

contract OptionalStruct {
    s: Inner?;

    init() {
        self.s = null;
    }
}
