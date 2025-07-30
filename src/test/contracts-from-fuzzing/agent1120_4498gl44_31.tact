struct S1 { a: Int; }
struct S2 { b: S1; }
struct S3 { c: S2; }

contract NestedStructs {
    nested: S3;
    init() {
        self.nested = S3{c: S2{b: S1{a: 123}}};
    }
}