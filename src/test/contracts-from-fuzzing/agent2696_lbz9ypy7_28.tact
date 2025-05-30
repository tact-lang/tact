struct InnerMost {
    a: Int?;
}

struct Middle {
    inmost: InnerMost?;
}

struct OuterMost {
    mid: Middle?;
}

contract DeepNull {
    field: OuterMost;
    init() {
        self.field = OuterMost{ mid: null };
    }
}