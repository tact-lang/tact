struct InnerMost {
    val: Int;
}

struct Middle {
    nested: InnerMost;
}

struct OuterMost {
    nested: Middle;
}

contract ReassignNested {
    data: OuterMost;
    init() {
        self.data = OuterMost{ nested: Middle{ nested: InnerMost{ val: 1 } } };
        self.data = OuterMost{ nested: Middle{ nested: InnerMost{ val: 2 } } };
    }
}