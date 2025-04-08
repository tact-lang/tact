struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    inner: Inner;
    
    init() {
        self.inner = Inner{
            a: 12,
            b: true,
            c: "nested test",
        };
    }
}