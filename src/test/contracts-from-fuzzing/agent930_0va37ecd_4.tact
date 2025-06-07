struct Inner {
    a: Int;
    b: Bool;
    s: String;
}

contract ManyStructFields {
    data: Inner;

    init() {
        self.data = Inner{
            a: 42,
            b: true,
            s: "hello",
        };
    }
}
