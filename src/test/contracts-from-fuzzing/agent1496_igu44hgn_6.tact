struct Inner {
    a: Int;
    b: Int?;
}

contract TestContract {
    data: Inner?;
    init() {
        self.data = null;
    }
}