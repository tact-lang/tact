struct DeeplyNested {
    a: Int;
    sub1: Sub1;
}

struct Sub1 {
    b: Int;
    sub2: Sub2;
}

struct Sub2 {
    c: Int;
    sub3: Sub3;
}

struct Sub3 {
    d: Int;
    e: Bool?;
}

contract NestedChain {
    inner: DeeplyNested;

    init() {
        self.inner = DeeplyNested{
            a: 1,
            sub1: Sub1{
                b: 2,
                sub2: Sub2{
                    c: 3,
                    sub3: Sub3{
                        d: 4,
                        e: true
                    }
                }
            }
        };
    }
}