struct Inner {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: Inner?;

    init() {
        self.data = null;
    }
}