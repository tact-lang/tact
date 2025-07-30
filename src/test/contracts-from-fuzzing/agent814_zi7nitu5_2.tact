struct Complex {
    foo: Int;
    bar: Bool;
}

struct Container {
    id: Int;
    nested: Complex?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            id: 42,
            nested: null
        };
    }
}