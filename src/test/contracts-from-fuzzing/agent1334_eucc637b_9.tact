struct InnerOptional {
    foo: Int?;
}

struct Container {
    opt: InnerOptional?;
}

contract NestedOptionals {
    data: Container;

    init() {
        self.data = Container{ opt: null };
    }
}