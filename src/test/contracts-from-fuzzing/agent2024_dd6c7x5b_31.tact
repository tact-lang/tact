struct Inner {
    a: Int;
}

contract InitWithDefaults {
    val: Inner = Inner{a:10};

    init() {
        self.val = Inner{a: 20};
    }
}