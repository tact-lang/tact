struct InnerMost {
    foo: Int;
}

struct Middle {
    mid: InnerMost;
}

struct OuterMost {
    outer: Middle;
}

contract Deeply {
    blob: OuterMost;

    init() {
        self.blob = OuterMost{
            outer: Middle{
                mid: InnerMost{
                    foo: 123
                }
            }
        };
    }
}
