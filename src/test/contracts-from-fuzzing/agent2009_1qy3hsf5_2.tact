struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    x: Int;
    y: Bool;
    z: S1;
}

struct S3 {
    foo: S2;
    bar: Int;
}

contract DeeplyNestedContract {
    nestedField: S3;
    init() {
        self.nestedField = S3{
            foo: S2{
                x: 1,
                y: true,
                z: S1{a: 42, b: false},
            },
            bar: 77,
        };
    }
}