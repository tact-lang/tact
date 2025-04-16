struct S1 {
    a: Int;
    b: String?;
}

struct S2 {
    s1: S1;
    z: Bool;
    m: String;
}

struct S3 {
    first: S2;
    second: S2;
    third: S2;
    fourth: S2;
}

contract NestedStructsWide {
    data: S3 = S3{
        first: S2{ s1: S1{ a:1, b:"b" }, z:true, m:"x" },
        second: S2{ s1: S1{ a:2, b:null }, z:false, m:"y" },
        third: S2{ s1: S1{ a:3, b:"d" }, z:true, m:"z" },
        fourth: S2{ s1: S1{ a:4, b:null }, z:false, m:"w" },
    };

    init() {
        self.data = S3{
            first: S2{ s1: S1{ a:10, b:"aaa" }, z:true, m:"m1" },
            second: S2{ s1: S1{ a:20, b:"bbb" }, z:false, m:"m2" },
            third: S2{ s1: S1{ a:30, b:"ccc" }, z:true, m:"m3" },
            fourth: S2{ s1: S1{ a:40, b:"ddd" }, z:false, m:"m4" },
        };
    }
}
