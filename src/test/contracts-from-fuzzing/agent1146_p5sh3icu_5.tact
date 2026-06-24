struct InnerMost {
    t: Bool;
}

struct Middle {
    s: InnerMost;
}

struct Outer {
    q: Middle;
}

contract DeepNestTest {
    deepValue: Outer;

    init() {
        self.deepValue = Outer{
            q: Middle{
                s: InnerMost{ t: false }
            }
        };
    }
}