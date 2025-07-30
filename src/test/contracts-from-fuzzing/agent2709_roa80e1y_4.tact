struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    nested: NestedOptional?;
}

contract ComplexOptionalStorage {
    x: Container;

    init() {
        self.x = Container{
            nested: null
        };
    }
}