struct InnerMost {
    f0: Int;
    f1: String;
    f2: Bool;
}

struct Middle {
    g0: Int;
    g1: InnerMost;
    g2: String;
    g3: Bool;
}

struct Outer {
    h0: Middle;
    h1: String;
}

contract NestedDeepContract {
    data: Outer;
    
    init() {
        self.data = Outer{
            h0: Middle {
                g0: 10,
                g1: InnerMost {
                    f0: 20,
                    f1: "abc",
                    f2: true
                },
                g2: "def",
                g3: false
            },
            h1: "xyz"
        };
    }
}