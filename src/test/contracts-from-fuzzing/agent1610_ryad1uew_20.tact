struct EmptyDefaults {
    x: Int;
}

struct Container {
    inner: EmptyDefaults?;
}

contract NestedOptStructDefaultCheck {
    value: Container;

    init() {
        self.value = Container{
            inner: null
        };
    }
}