struct OptionalNested {
    a: Int?;
}

struct Container {
    inner: OptionalNested?;
}

contract NestedOptionalStruct {
    f: Container;
    init() {
        self.f = Container{inner: null};
    }
}