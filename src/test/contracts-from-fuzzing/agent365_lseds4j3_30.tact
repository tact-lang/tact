struct S {
    a: Int;
    b: S1;
}

struct S1 {
    c: Int?;
    d: String;
}

contract SOptionalNest {
    f: S;

    init() {
        self.f = S{
            a: 123,
            b: S1{
                c: null,
                d: "test"
            }
        };
    }
}