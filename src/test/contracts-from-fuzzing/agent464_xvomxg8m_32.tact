struct InnerMost {
    val: Int;
}

struct Mid {
    inner: InnerMost;
}

struct OuterMost {
    mid: Mid;
}

contract MultiEmbed {
    outer: OuterMost;

    init() {
        self.outer = OuterMost{ mid: Mid{ inner: InnerMost{ val:123 } } };
    }
}
