struct S1 {x:Int}
struct S2 {x:Int}
struct S3 {x:Int}
struct S4 {x:Int}

contract NearDuplicates {
    s1:S1;
    s2:S2;
    s3:S3;
    s4:S4;

    init() {
        self.s1 = S1{x:1};
        self.s2 = S2{x:2};
        self.s3 = S3{x:3};
        self.s4 = S4{x:4};
    }
}
