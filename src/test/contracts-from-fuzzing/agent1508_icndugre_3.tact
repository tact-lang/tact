struct InnerMost {
    z: String;
}

struct Middle {
    y: InnerMost;
}

struct Outer {
    x: Middle;
}

contract DeepNested {
    field: Outer;

    init() {
        self.field = Outer{
            x: Middle{
                y: InnerMost{
                    z: "deep"
                }
            }
        };
    }
}
