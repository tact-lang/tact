struct InnerMost {
    val: Int;
}

struct MiddleLevel {
    info: InnerMost;
}

struct OuterLevel {
    middle: MiddleLevel;
}

contract DeeplyNestedFlat {
    st: OuterLevel;

    init() {
        self.st = OuterLevel{
            middle: MiddleLevel{
                info: InnerMost{ val: 123 }
            }
        };
    }
}
