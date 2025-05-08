struct Foo {
    bar: Int;
}

struct Bar {
    foo: Foo;
}

struct Baz {
    bar: Bar;
}

contract DeepStructOpt {
    deep: Baz?;

    init() {
        self.deep = null;
    }
}
