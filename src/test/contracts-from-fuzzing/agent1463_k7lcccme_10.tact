struct S1 { foo: Int }
struct S2 { bar: S1 }
struct S3 { baz: S2 }

contract TestContract {
    deep: S3;

    init() {
        self.deep = S3{ baz: S2{ bar: S1{ foo: 10 } } };
    }
}