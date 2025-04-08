struct NestedOptional {
    a: Int?;
    inner: Inner?;
}

struct Inner {
    b: Bool;
    addr: Address;
}

contract OptionalDeep {
    test: NestedOptional;

    init() {
        self.test = NestedOptional{
            a: null,
            inner: Inner{ b: true, addr: myAddress() }
        };
    }
}