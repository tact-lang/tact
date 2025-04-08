struct Foo {
    x: Int?;
    y: Bool?;
}

struct Bar {
    foo1: Foo?;
    foo2: Foo?;
}

contract TestContract {
    val: Bar;

    init() {
        self.val = Bar{foo1: null, foo2: Foo{x: 1, y:true}};
    }
}