struct InnerMost { a: Int; }

struct Middle {
    inner1: InnerMost; 
    inner2: InnerMost;
}

struct OuterMost {
    mid1: Middle;
    mid2: Middle;
}

contract DupNested {
    field: OuterMost;

    init() {
        self.field = OuterMost{
            mid1: Middle{ inner1: InnerMost{a: 1}, inner2: InnerMost{a: 2} },
            mid2: Middle{ inner1: InnerMost{a: 3}, inner2: InnerMost{a: 4} }
        };
    }
}