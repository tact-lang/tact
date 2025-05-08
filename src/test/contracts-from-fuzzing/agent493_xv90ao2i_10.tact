struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    inner: NestedOptionals?;
}

contract NullableInnerStruct {
    data: Container;

    init() {
        self.data = Container{ inner: null };
    }
}