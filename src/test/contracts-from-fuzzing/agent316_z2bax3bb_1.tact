struct Inner {
    a: Int;
    b: String;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{
            a: 123,
            b: "hello"
        };
    }
}
