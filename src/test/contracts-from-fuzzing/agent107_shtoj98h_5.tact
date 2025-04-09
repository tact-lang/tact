struct NestedOptional {
    foo: Foo?;
}

struct Foo {
    val: Int;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            foo: Foo{ val: 42 }
        };
    }
}
