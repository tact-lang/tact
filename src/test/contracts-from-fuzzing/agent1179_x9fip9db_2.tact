struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            a: 10,
            b: false,
            c: "test"
        };
    }

    receive() {}
}