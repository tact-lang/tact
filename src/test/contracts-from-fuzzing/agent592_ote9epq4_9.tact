struct Inner {
    val: Int;
    flag: Bool;
    note: String?;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{ val: 5, flag: true, note: null };
    }

    receive() {}
}