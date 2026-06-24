struct InnerMost {
    val: Int;
}

struct Mid {
    nested: InnerMost;
}

struct OuterMost {
    mid: Mid;
}

contract FourLevels {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            mid: Mid{
                nested: InnerMost{ val: 111 }
            }
        };
    }
}