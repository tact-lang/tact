struct NestedStructRef {
    n: Nested;
}

struct Nested {
    inner: StructSimple;
}

struct StructSimple {
    foo: Int;
    bar: Bool;
}

contract DeepStructFields {
    f: NestedStructRef;

    init() {
        self.f = NestedStructRef{
            n: Nested{
                inner: StructSimple{
                    foo: 123,
                    bar: true
                }
            }
        };
    }
}
