struct S1 {
    x: Int;
    y: Bool;
    z: String;
}

struct S2 {
    s1: S1;
    a: Int;
    b: String;
}

struct S3 {
    s2: S2;
    k: Int;
    m: Bool?;
}

contract StructNestedFields {
    data: S3;
    init() {
        self.data = S3{
            s2: S2{
                s1: S1{
                    x:1, y:true, z:"z"
                },
                a: 2,
                b: "b",
            },
            k: 9,
            m: null,
        };
    }
}
