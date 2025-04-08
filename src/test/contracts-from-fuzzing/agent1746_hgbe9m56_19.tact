struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

struct S2 {
    a: S1;
    b: Int;
    c: Bool;
}

struct S3 {
    a: S2;
    b: S2;
}

contract DoubleNested {
    storage: S3;

    init() {
        self.storage = S3{
            a: S2{a:S1{a:1,b:true,c:"x",d:null},b:2,c:false},
            b: S2{a:S1{a:3,b:false,c:"y",d:4},b:5,c:true}
        };
    }
}
