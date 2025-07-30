struct NestedManyOptionals {
    nested: NestedOptionals;
}

struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract NestManyOpts {
    foo: NestedManyOptionals;
    init() {
        self.foo = NestedManyOptionals{ nested: NestedOptionals{ x: null, y: null, z: null } };
    }
}