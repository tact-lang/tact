struct SDeep {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
}

struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: String; }
struct S4 { flag: Bool; }

contract TestContract {
    deep: SDeep;

    init() {
        self.deep = SDeep{
            s1: S1{x:1},
            s2: S2{y:true},
            s3: S3{z:"ok"},
            s4: S4{flag:false}
        };
    }
}