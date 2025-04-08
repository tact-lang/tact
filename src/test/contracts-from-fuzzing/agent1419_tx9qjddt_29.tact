struct Inner {
    foo: Int;
}

contract NestedStructSeparate {
    data: Inner;

    init() {
        self.data = Inner{ foo: 5 };
    }
}