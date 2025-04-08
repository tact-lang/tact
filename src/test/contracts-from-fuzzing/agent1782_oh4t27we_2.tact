struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestNested {
    data: Inner;

    init() {
        self.data = Inner{
            a: 5,
            b: false,
            c: "hello"
        };
    }
}