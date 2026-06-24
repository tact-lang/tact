struct Inner {
    flag: Bool;
    val: Int?;
    txt: String;
}

contract OptionalStruct {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}