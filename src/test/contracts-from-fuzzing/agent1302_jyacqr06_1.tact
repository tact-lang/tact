struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{ foo: null, bar: true };
    }

    receive() {
        // access nested optionals
        let f = self.data.foo;
        let b = self.data.bar;
    }
}
