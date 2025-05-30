struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: Int?;
    d: Bool?;
    e: S1;
}

struct S3 {
    x: S2;
    y: S2?;
}

contract DeepNestedOpt {
    data: S3;
    init() {
        self.data = S3{
            x: S2{c:1,d:true,e:S1{a:2,b:false}},
            y: null
        };
    }
}