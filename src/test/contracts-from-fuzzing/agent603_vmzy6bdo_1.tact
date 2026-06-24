struct DeepNestedOpt {
    foo: Int?;
    bar: Inner?;
}

struct Inner {
    baz: Int;
}

contract TestContract {
    data: DeepNestedOpt;

    init() {
        self.data = DeepNestedOpt{ foo: null, bar: null };
    }
}