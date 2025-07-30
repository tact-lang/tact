struct Inner {
    flag: Bool;
    val: Int?;
}

contract OptionalNested {
    inner: Inner?;

    init() {
        self.inner = Inner{
            flag: true,
            val: null,
        };
    }
}