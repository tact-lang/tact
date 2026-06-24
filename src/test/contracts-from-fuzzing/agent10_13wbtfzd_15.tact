struct Sub {
    foo: Int;
}

struct Container {
    optSub: Sub?;
    optAddr: Address? = null;
}

contract OptionalNestedFields {
    data: Container;

    init() {
        self.data = Container{
            optSub: null,
            optAddr: null
        };
    }
}