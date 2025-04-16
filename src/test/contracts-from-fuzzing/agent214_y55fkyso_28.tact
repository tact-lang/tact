struct InnerX {
    x1: Int;
    x2: Int;
}

struct OuterX {
    y1: Int;
    y2: InnerX;
}

contract ShallowNest {
    a: OuterX;

    init() {
        self.a = OuterX{
            y1: 4,
            y2: InnerX{ x1:5, x2:6 }
        };
    }
}