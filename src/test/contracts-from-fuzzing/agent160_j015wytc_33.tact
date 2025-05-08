struct InnerMost {
    flag: Bool;
}

struct Mid {
    wrapped: InnerMost?;
}

struct TopLevel {
    middle: Mid?;
}

contract DoubleOptTest {
    s: TopLevel;
    init() {
        self.s = TopLevel{
            middle: Mid{
                wrapped: null
            }
        };
    }
}