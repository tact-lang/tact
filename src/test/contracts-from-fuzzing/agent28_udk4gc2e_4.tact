struct Inner {
    flag: Bool;
    count: Int;
}

contract ArrayLike {
    item1: Inner;
    item2: Inner;
    item3: Inner;

    init() {
        self.item1 = Inner{flag: true, count: 1};
        self.item2 = Inner{flag: false, count: 2};
        self.item3 = Inner{flag: true, count: 3};
    }
}
