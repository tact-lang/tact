struct Inner {
    flag: Bool;
}

contract Test {
    data: Inner?;

    init() {
        self.data = null;
    }
}