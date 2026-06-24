struct NestedFlattened {
    x: Int;
    y: Int;
    z: Int;
}

contract FlattenedFields {
    a: Int;
    nested: NestedFlattened;
    b: Int;
    c: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.nested = NestedFlattened{x: 10, y: 20, z:30};
    }
}