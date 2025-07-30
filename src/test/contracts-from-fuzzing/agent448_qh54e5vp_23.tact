struct InnerOne { x: Int; }
struct InnerTwo { y: Int; }

struct OuterBoth {
    i1: InnerOne;
    i2: InnerTwo;
}

contract TwoDifferentNestedStructs {
    f: OuterBoth;
    init() {
        self.f = OuterBoth{
            i1: InnerOne{ x: 1 },
            i2: InnerTwo{ y: 2 }
        };
    }
}