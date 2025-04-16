struct BigNested {
    a: Int;
    b: InnerLv1;
}

struct InnerLv1 {
    c: Int;
    d: InnerLv2;
}

struct InnerLv2 {
    e: Int;
    f: InnerLv3;
}

struct InnerLv3 {
    g: Int;
}

contract DeepTree {
    val: BigNested;

    init() {
        self.val = BigNested{
            a:1,
            b: InnerLv1{
                c:2,
                d: InnerLv2{
                    e: 3,
                    f: InnerLv3{
                        g:4
                    }
                }
            }
        };
    }
}
