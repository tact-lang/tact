struct S1 { one: Int; two: Bool; }
struct S2 { a: S1; b: S1; }
struct S3 { x: S2; y: S2; z: S2; }
contract WideNestedStruct {
    data: S3;

    init() {
        self.data = S3{
            x: S2{ a:S1{one:1,two:true}, b:S1{one:2,two:false} },
            y: S2{ a:S1{one:3,two:true}, b:S1{one:4,two:false} },
            z: S2{ a:S1{one:5,two:true}, b:S1{one:6,two:false} }
        };
    }
}