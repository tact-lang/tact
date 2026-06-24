struct Bar {
    foo: Int;
}

struct Container {
    bar: Bar;
}

contract SerializeChain {
    store: Container;

    init() {
        self.store = Container{
            bar: Bar{ foo: 99 }
        };
    }
}