struct InnerOne {
    v: Int;
}

struct OuterOne {
    i1: InnerOne;
    i2: InnerOne;
}

contract MultipleInnerReferences {
    s: OuterOne;
    init() {
        self.s = OuterOne{
            i1: InnerOne{ v: 1 },
            i2: InnerOne{ v: 2 }
        };
    }
}