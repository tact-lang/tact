struct Foo {
    a: Int?;
    b: Bool?;
}

struct Bar {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    fooData: Foo?;
    barData: Bar?;

    init() {
        self.fooData = null;
        self.barData = null;
    }
}