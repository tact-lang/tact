struct Foo {
    val: Int;
}

struct Bar {
    first: Foo;
    second: Foo?;
    third: Foo;
}

contract TestContract {
    data: Bar;

    init() {
        self.data = Bar{
            first: Foo{val:1},
            second: null,
            third: Foo{val:3},
        };
    }
}