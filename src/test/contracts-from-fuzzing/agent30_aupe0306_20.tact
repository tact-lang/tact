struct DeeplyNested {
    a: Int;
    b: Nested1;
}

struct Nested1 {
    c: Int;
    d: Nested2;
}

struct Nested2 {
    e: Int;
    f: Nested3;
}

struct Nested3 {
    g: Int;
}

contract DeepNestBig {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            a: 1,
            b: Nested1{
                c: 2,
                d: Nested2{
                    e: 3,
                    f: Nested3{
                        g: 4
                    }
                }
            }
        };
    }
}