struct DeeplyNested {
    a: Int;
    inner: Middle;
}

struct Middle {
    b: Int;
    inner2: Bottom;
}

struct Bottom {
    c: Int;
}

contract DeepNestEdge {
    f: DeeplyNested;
    init() {
        self.f = DeeplyNested{
            a: 1,
            inner: Middle {
                b: 2,
                inner2: Bottom { c:3 }
            }
        };
    }
}