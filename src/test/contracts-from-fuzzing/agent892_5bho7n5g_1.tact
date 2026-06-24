struct Inner {
    flag: Bool;
    count: Int;
}

contract Test {
    point: Inner;
    number: Int;

    init() {
        self.point = Inner{flag: true, count: 1};
        self.number = 42;
    }
}