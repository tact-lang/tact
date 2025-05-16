struct Inner {
    flag: Bool;
    count: Int;
}

contract TestNested {
    data: Inner;

    init() {
        self.data = Inner{
            flag: true,
            count: 42,
        };
    }
}