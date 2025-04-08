struct S1 {v1: Int; s2: S2;}
struct S2 {v2: Int; s3: S3;}
struct S3 {v3: Int; s4: S4;}
struct S4 {v4: Int;}

contract NestedOpt {
    opt: S1?;
    
    init() {
        self.opt = null;
    }
}