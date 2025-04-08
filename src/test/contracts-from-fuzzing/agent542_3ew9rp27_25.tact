struct NestedOptionalDefaults {
    foo: Foo?;
}

struct Foo {
    x: Int = 4;
    y: String = "hello";
}

contract TestContract {
    data: NestedOptionalDefaults;

    init() {
        self.data = NestedOptionalDefaults{
            foo: Foo{}
        };
    }
}