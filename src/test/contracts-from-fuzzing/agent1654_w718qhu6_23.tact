struct OuterDEF {
    x: Int;
    nested: InnerDEF;
}

struct InnerDEF {
    value: Int;
}

contract CDEF {
    f: OuterDEF;

    init() {
        self.f = OuterDEF{
            x: 1,
            nested: InnerDEF{ value: 2 }
        };
    }
}