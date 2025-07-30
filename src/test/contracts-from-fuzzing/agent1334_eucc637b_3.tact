struct DeepNest {
    inner: Inner;
}

struct Inner {
    foo: Foo;
}

struct Foo {
    val: Int;
    opt: Int?;
}

contract DeepNested {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            inner: Inner{
                foo: Foo{ val: 1, opt: null }
            }
        };
    }
}