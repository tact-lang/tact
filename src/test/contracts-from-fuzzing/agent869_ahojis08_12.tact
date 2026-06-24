struct Foo {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Bar {
    foo1: Foo?;
    foo2: Foo?;
}

contract TestContract {
    f: Bar;

    init() {
        self.f = Bar{
            foo1: Foo{ x: 1, y: null, z: null },
            foo2: null
        };
    }
}