struct Inner {
    a: Int;
    b: String;
    c: Bool?;
}

contract TestContract {
    record: Inner;

    init() {
        self.record = Inner{
            a: 123,
            b: "hello",
            c: true,
        };
    }
}