struct Inner {
    flag: Bool;
    count: Int;
}

contract WithStruct {
    data: Inner;

    init() {
        self.data = Inner{flag: true, count: 7};
    }
}