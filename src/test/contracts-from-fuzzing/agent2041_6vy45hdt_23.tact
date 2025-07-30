struct DeeplyNested {
    innermost: Int;
}

struct InnerMid {
    nested: DeeplyNested;
}

struct OuterMost {
    mid: InnerMid;
}

contract CrazyNesting {
    info: OuterMost;
    init() {
        self.info = OuterMost{
            mid: InnerMid{
                nested: DeeplyNested{ innermost: 77 }
            }
        };
    }
}