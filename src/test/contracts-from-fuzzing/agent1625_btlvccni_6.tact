struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost;
}

struct Outer {
    x: Middle;
}

contract PersistNested {
    nested: Outer;

    init() {
        self.nested = Outer{
            x: Middle{
                y: InnerMost{
                    z: 123
                }
            }
        };
    }
}
