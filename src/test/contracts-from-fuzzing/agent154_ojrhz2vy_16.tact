struct S2 {
    a: Int;
    b: Bool;
}

struct S3 {
    a: Int;
    s2: S2;
    b: String;
}

struct S4 {
    s3_a: S3;
    s3_b: S3;
    flag: Bool;
}

contract NestedDuplicateStructs {
    all: S4;

    init() {
        self.all = S4{
            s3_a: S3{a:1,s2:S2{a:2,b:true},b:"x"}, 
            s3_b: S3{a:3,s2:S2{a:4,b:false},b:"y"}, 
            flag:true
        };
    }
}