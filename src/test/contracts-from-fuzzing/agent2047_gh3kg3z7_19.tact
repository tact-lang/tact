struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

struct S2 {
    foo: Int;
    bar: S1;
}

struct S3 {
    bazz: Bool;
    nested: S2;
}

contract MixMultiNest {
    data: S3;

    init() {
        self.data = S3{
            bazz:true,
            nested:S2{
                foo:123,
                bar:S1{
                    a:1,
                    b:false,
                    c:"hi"
                }
            }
        };
    }
}