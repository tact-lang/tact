struct Inner {
    f1: Int;
    f2: Int?;
}

struct Outer {
    s1: Inner;
    s2: Inner;
    s3: Inner;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            s1: Inner{ f1:1, f2:null },
            s2: Inner{ f1:2, f2:null },
            s3: Inner{ f1:3, f2:null }
        };
    }
}