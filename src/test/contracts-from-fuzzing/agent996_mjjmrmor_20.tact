struct NestedStrOpt {
    foo: Foo?;
}

struct Foo {
    bar: Bar?;
}

struct Bar {
    val: String?;
}

contract TestStorage {
    content: NestedStrOpt;

    init() {
        self.content = NestedStrOpt{
            foo: Foo{
                bar: Bar{
                    val: "hello"
                }
            }
        };
    }
}