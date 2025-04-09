struct Inner {
    foo: Int?;
}

contract TestContract {
    data: Inner?;

    init() {
        self.data = Inner{ foo: null };
    }
}
