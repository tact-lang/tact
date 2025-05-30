struct Inner {
    flag: Bool;
    txt: String;
    val: Int;
}

contract DefaultsOptional {
    inner: Inner?;
    init() {
        self.inner = null;
    }
}