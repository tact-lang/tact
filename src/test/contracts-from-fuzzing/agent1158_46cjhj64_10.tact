struct Inner {
    b: Bool;
    txt: String;
}

contract OptionalStruct {
    s: Inner?;

    init() {
        self.s = null;
    }
}
