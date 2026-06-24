struct S1 {
    field1: Int;
}

struct S2 {
    nested: S1;
}

struct S3 {
    nested: S2;
}

struct S4 {
    nested: S3;
}

contract VeryDeepNest {
    data: S4;

    init() {
        self.data = S4{ nested: S3{ nested: S2{ nested: S1{ field1: 42 } } } };
    }
}