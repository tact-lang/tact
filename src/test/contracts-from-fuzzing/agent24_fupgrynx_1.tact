struct Inner {
    flag: Bool;
    count: Int;
}

contract TestStorage {
    data: Inner;

    init() {
        self.data = Inner{flag: true, count: 1};
    }
}