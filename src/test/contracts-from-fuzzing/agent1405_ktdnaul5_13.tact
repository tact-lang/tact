struct InnerMost {
    value: Int;
}

struct Middle {
    innermost: InnerMost;
}

struct OuterMost {
    middle: Middle;
}

contract DeepThreeLevel {
    content: OuterMost;

    init() {
        self.content = OuterMost{
            middle: Middle{
                innermost: InnerMost{ value: 42 }
            }
        };
    }
}