struct BigNested {
    f1: Int;
    f2: InnerBig;
    f3: Int;
}

struct InnerBig {
    g1: Int;
    g2: Int?;
    g3: Bool;
}

contract BigNestedContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            f1: 1,
            f2: InnerBig{
                g1:2,
                g2:null,
                g3:true,
            },
            f3: 3,
        };
    }
}