struct VeryDeepNested {
    x: Int;
    y: InnerA;
}

struct InnerA {
    q: Int;
    w: InnerB;
}

struct InnerB {
    e: Int;
    r: InnerC;
}

struct InnerC {
    t: Int;
}

contract VeryDeepNestedContract {
    v: VeryDeepNested;
    init() {
        self.v = VeryDeepNested{
            x:1,
            y: InnerA{
                q:2,
                w: InnerB{
                    e:3,
                    r: InnerC{t:4}
                }
            }
        };
    }
}