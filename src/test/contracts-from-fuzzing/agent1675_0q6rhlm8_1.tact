struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    data: Inner;

    init() {
        self.data = Inner{
            a: 1,
            b: true,
            c: "test"
        };
    }
}