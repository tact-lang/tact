struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            a: 123,
            b: true,
            c: "hello"
        };
    }

    receive() {
        let _ = self.data.a;
    }
}