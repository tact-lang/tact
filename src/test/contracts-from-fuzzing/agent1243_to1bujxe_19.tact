struct InnerMost {
    n: Int;
}

struct Middle {
    val: InnerMost?;
}

struct OuterMost {
    m: Middle?;
}

contract Test {
    x: OuterMost;
    init() {
        self.x = OuterMost{ m: null };
    }
}