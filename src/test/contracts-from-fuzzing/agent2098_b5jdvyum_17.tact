struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct Container {
    nested: NestedOptionals?;
}

contract OptionalNest {
    data: Container = Container{nested: null};
}
