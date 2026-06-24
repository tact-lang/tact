struct InnerMost {
    a: Int;
}

struct Middle {
    m: InnerMost;
}

struct Outer {
    o: Middle;
}

contract TripleNestTest {
    data: Outer;

    init() {
        self.data = Outer{
            o: Middle{
                m: InnerMost{
                    a: 99
                }
            }
        };
    }
}