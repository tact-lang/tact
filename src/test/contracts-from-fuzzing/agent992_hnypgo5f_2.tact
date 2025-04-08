struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    data: Inner;
    init() {
        self.data = Inner{
            a: 7,
            b: false,
            c: "hello",
        };
    }
}
