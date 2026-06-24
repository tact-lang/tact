struct Inner {
    val: Int;
    flag: Bool;
}

contract TestContract {
    optInner: Inner?;
    init() {
        self.optInner = Inner{ val: 99, flag: true };
    }
}