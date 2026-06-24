struct Inner {
    f: Int;
}

contract TestContract {
    complicated: Inner?;

    init() {
        self.complicated = Inner{ f: 123 };
    }
}