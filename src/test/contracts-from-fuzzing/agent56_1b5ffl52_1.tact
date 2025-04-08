struct Inner {
    a: Int;
    b: Bool?;
}

contract Test {
    data: Inner;

    init() {
        self.data = Inner{
            a: 42,
            b: true,
        };
    }
}