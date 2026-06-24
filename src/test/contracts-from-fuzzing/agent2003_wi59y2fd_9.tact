struct Inner {
    flag: Bool;
}

contract TestContract {
    optField: Inner?;

    init() {
        self.optField = null;
    }
}
