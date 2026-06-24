struct OptionalNested {
    inner: Bool?;
}

struct Container {
    nested: OptionalNested;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{nested: OptionalNested{inner: null}};
    }
}