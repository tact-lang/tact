struct DeeplyNested {
    a: Int; b: Int; c: Int;
    d: Int; e: Int; f: Int;
}

struct MoreNest {
    nest: DeeplyNested;
    val: Int;
}

contract NestWithinNest {
    m: MoreNest;

    init() {
        self.m = MoreNest{
            nest: DeeplyNested{
                a:1,b:2,c:3,d:4,e:5,f:6
            },
            val: 100
        };
    }
}
