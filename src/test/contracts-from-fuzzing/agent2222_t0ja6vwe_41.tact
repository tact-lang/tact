struct Inner {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    s: Inner;

    init() {
        self.s = Inner{ foo:null, bar:null };
    }
}