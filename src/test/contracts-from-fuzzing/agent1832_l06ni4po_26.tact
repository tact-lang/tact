struct OuterMost {
    a: Int;
    inner: Middle;
}

struct Middle {
    b: Int;
    inner: InnerMostOptional;
}

struct InnerMostOptional {
    c: Int?;
    d: String?;
    e: Bool;
}

contract DeepOptionMiddle {
    val: OuterMost;

    init() {
        self.val = OuterMost{
            a:1,
            inner: Middle{
                b:2,
                inner: InnerMostOptional{
                    c:null,
                    d:null,
                    e:true
                }
            }
        };
    }
}
