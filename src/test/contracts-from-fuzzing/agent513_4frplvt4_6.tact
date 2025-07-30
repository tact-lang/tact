struct Inner {
    a: Int;
    b: Bool;
    c: Address;
    s: String;
}

contract Test {
    inner: Inner;

    init() {
        self.inner = Inner{
            a: 1,
            b: true,
            c: myAddress(),
            s: "str"
        };
    }

    receive() {}
}