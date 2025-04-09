struct NestedOptional {
    maybe: Int?;
}

struct Container {
    nested: NestedOptional?;
}

contract NestedOptionalContract {
    storage: Container;

    init() {
        self.storage = Container{
            nested: null
        };
    }
}