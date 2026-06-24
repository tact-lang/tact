struct NestedOptional {
    id: Int;
    name: String?;
    flag: Bool?;
}

struct Container {
    nested: NestedOptional?;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            nested: null,
        };
    }
}
