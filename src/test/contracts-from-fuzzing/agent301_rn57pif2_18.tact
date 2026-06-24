struct Inner {
    foo: Int?;
    bar: String?;
}

contract TestContract {
    data: Inner?;

    init() {
        self.data = null;
    }

    receive() {
        let _ = self.data;
    }
}