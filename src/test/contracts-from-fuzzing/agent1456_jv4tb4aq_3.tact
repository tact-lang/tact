struct Inner {
    count: Int;
    isActive: Bool;
    label: String;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            count: 123,
            isActive: true,
            label: "fuzz"
        };
    }

    receive() {
        self.inner = Inner{
            count: 456,
            isActive: false,
            label: "buzz"
        };
    }
}