struct S1 {
    f1: Int;
    f2: Bool;
}

struct S2 {
    f3: S1;
    f4: Bool?;
}

struct S3 {
    f5: S2;
    f6: Int?;
}

contract TestContract {
    x: S3 = S3{
        f5: S2{f3: S1{f1:1,f2:true}, f4:null},
        f6: null
    };

    init() {
        self.x = S3{
            f5: S2{f3: S1{f1:2,f2:false}, f4:true},
            f6: 10
        };
    }
}