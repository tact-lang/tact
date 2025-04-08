// Struct with deeply nested bool
struct InnerMost {
    flag: Bool;
}

struct Middle {
    deeper: InnerMost;
}

struct OuterMost {
    middle: Middle;
}

contract DeepBoolNest {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            middle: Middle{
                deeper: InnerMost{ flag: false }
            }
        };
    }
}