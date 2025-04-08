struct S1 {
    x: Int = 1;
}
struct S2 {
    y: Int = 2;
    s1: S1;
}
struct S3 {
    z: Int = 3;
    s2: S2;
    optField: S2?;
}

contract DefaultDeepNested {
    foo: S3;

    init() {
        self.foo = S3{
            z: 4,
            s2: S2{ y: 5, s1: S1{ x: 6 } },
            optField: null
        };
    }
}