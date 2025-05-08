struct WithDefaultInner {
    foo: Int = 777;
    bar: Bool = false;
}

struct HasInner {
    inner: WithDefaultInner;
}

contract DefaultsInNested {
    field: HasInner;

    init() {
        self.field = HasInner{
            inner: WithDefaultInner{},
        };
    }
}
