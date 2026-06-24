struct DeeplyNestedOptionals {
    innerOpt: InnerOption?;
}

struct InnerOption {
    foo: Foo?;
}

struct Foo {
    val: Int = 123;
}

contract TestContract {
    test: DeeplyNestedOptionals;

    init() {
        self.test = DeeplyNestedOptionals{ innerOpt: InnerOption{ foo: Foo{} } };
    }
}
