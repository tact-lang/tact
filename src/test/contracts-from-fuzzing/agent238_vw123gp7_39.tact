struct Chain {
    inner: Inner?;
}

struct Inner {
    foo: Foo?;
}

struct Foo {
    bar: Bar?;
}

struct Bar {
    baz: Int?;
}

contract DeepChain {
    data: Chain;

    init() {
        self.data = Chain{inner:null};
    }
}