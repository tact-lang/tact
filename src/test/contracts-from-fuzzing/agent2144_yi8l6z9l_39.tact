struct InnerMost {
    x: Int;
}

struct Mid {
    im: InnerMost;
}

struct OuterMost {
    mid: Mid;
}

contract OptOuterMost {
    data: OuterMost?;

    init() {
        self.data = OuterMost{ mid: Mid{ im: InnerMost{ x: 7 } } };
    }
}
