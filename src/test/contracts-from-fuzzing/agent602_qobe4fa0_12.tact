struct S0 {
    x: Int;
    y: Bool;
}

struct S1 {
    one: S0;
    two: S0?;
    three: S0?;
}

struct S2 {
    a: S1;
    b: S1?;
}

struct S3 {
    inner: S2?;
    val: Int;
}

contract TestContract {
    nested: S3;

    init() {
        self.nested = S3{
            inner: S2{
                a: S1{
                    one: S0{ x:1, y:true },
                    two: null,
                    three: null,
                },
                b: null,
            },
            val: 99,
        };
    }
}