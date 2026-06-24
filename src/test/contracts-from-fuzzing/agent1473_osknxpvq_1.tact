struct Inner {
    num: Int;
    flag: Bool;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{
            num: 42,
            flag: true,
        };
    }
}