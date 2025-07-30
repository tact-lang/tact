struct MultiNested {
    a: InnerA;
    b: InnerB;
}

struct InnerA {
    xa: Bool?;
    ya: Int;
}

struct InnerB {
    xb: Int?;
    yb: Bool;
}

contract TestContract {
    m: MultiNested;

    init() {
        self.m = MultiNested{
            a: InnerA{ xa:null, ya:1 },
            b: InnerB{ xb:null, yb:true }
        };
    }
}