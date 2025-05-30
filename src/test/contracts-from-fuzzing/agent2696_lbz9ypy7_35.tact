struct InnerX {
    i: Int;
}

struct OuterX {
    s: InnerX;
}

contract MultiAssign {
    o: OuterX;
    init() {
        self.o = OuterX{ s: InnerX{ i:123 } };
    }
}