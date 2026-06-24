struct DefInner {
    a: Int = 3;
    b: String = "str";
}

contract DefaultedStructField {
    inner: DefInner;

    init() {
        self.inner = DefInner{};
    }

    receive() {}
}