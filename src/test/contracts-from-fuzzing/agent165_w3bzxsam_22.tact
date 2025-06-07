struct InnerMost {
    val: Int;
}

struct Mid {
    nested: InnerMost;
}

struct OuterMost {
    mid: Mid;
}

contract Chain {
    c: OuterMost;

    init() {
        self.c = OuterMost{ mid: Mid{ nested: InnerMost{ val: 77 } } };
    }
}