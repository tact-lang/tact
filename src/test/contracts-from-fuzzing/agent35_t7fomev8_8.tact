struct Inner {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            flag1: true,
            flag2: false,
            flag3: true,
            flag4: false,
            flag5: true,
        };
    }
}
