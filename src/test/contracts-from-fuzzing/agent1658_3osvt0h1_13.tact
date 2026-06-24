struct InnerS {
    s1: Int;
    s2: Int;
    s3: Int;
}

struct OuterS {
    o1: InnerS;
    o2: InnerS;
}

contract DoublyNested {
    store: OuterS;

    init() {
        self.store = OuterS{
            o1: InnerS{ s1:1, s2:2, s3:3 },
            o2: InnerS{ s1:4, s2:5, s3:6 }
        };
    }
}