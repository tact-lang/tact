struct Derived {
    val: Int;
}

contract DefaultVal {
    inner: Derived = Derived{ val: 123 };

    init() {
        self.inner = Derived{ val: 456 };
    }
}