struct S1 {
   f: Int;
}

struct S2 {
   s1: S1;
}

struct S3 {
   s2: S2;
}

contract ChainTest {
    obj: S3;
    init() {
        self.obj = S3{
            s2: S2{
                s1: S1{ f: 7 }
            }
        };
    }
}