struct S {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

struct S2 {
    s1: S;
    s2: S;
    s3: S;
}

contract MultiNested {
    val: S2;
    init() {
        self.val = S2{
            s1: S{a:1,b:2,c:3,d:4,e:5,f:6},
            s2: S{a:7,b:8,c:9,d:10,e:11,f:12},
            s3: S{a:13,b:14,c:15,d:16,e:17,f:18},
        };
    }
}