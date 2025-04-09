struct DeepOpt {
    inner: Inner?;
}

struct Inner {
    foo: Foo?;
}

struct Foo {
    bar: Int;
}

contract DeeperOptional {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{ inner: null };
    }
}