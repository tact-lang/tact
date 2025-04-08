struct S1 {
    foo: Int;
}

struct S2 {
    bar: S1;
}

struct S3 {
    baz: S2;
}

contract ThreeDeep {
    nested: S3;
    init() {
        self.nested = S3{ baz: S2{ bar: S1{ foo: 123 } } };
    }
}