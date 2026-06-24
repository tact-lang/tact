struct Inner {
    flag: Bool;
    count: Int;
    note: String?;
}

contract NestedContract {
    data: Inner;

    init() {
        self.data = Inner{flag: false, count: 0, note: null};
    }
}
