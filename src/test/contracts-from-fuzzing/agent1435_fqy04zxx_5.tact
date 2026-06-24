struct NestedOptional {
    innerOpt: Int?;
}

struct Container {
    val: Int;
    nested: NestedOptional?;
}

contract OptionalStorage {
    store: Container;

    init() {
        self.store = Container{
            val: 100,
            nested: null
        };
    }
}