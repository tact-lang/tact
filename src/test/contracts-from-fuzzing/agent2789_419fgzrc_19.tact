struct OptionalInNested {
    foo: Int; 
    bar: Bool?;
}

struct Container {
    inner: OptionalInNested;
    more: Int;
}

contract OptionalNestedContainer {
    d: Container;

    init() {
        self.d = Container{
            inner: OptionalInNested{
                foo: 1,
                bar: null
            },
            more: 2
        };
    }
}
