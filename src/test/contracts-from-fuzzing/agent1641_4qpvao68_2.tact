struct Inner {
    flag: Bool;
    count: Int = 0;
    note: String = "";
}

contract NestedContract {
    inner: Inner = Inner{flag: true, count: 5, note: "hi"};

    init() {
        self.inner = Inner{flag: false, count: 10, note: "bye"};
    }
}