struct S1 {
    f1: Int;
}
struct S2 {
    f2: S1;
}
struct S3 {
    f3: S2;
}

contract DeepNest {
    nested: S3;

    init() {
        self.nested = S3{
            f3: S2{ f2: S1{ f1: 42 } }
        };
    }
}