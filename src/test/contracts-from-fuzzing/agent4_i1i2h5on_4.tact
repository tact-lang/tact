struct Outer {
    p: Int;
    q: Middle;
}

struct Middle {
    r: Int;
    s: InnerMost;
}

struct InnerMost {
    x: Int;
    y: Bool;
}

contract TestContract {
    z: Outer;

    init() {
        self.z = Outer{
            p: 10,
            q: Middle {
                r: 20,
                s: InnerMost {
                    x: 30,
                    y: true
                }
            }
        };
    }
}
