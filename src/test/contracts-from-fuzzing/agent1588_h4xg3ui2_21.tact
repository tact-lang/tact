struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost;
}

struct Outer {
    x: Middle;
}

contract DeepStructs {
    s: Outer;
    
    init() {
        self.s = Outer {
            x: Middle {
                y: InnerMost {
                    z: 999
                }
            }
        };
    }
}