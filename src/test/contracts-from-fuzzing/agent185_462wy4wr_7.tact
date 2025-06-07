struct InnerMost {
    z: Int;
}

struct Middle {
    y: InnerMost;
}

struct Outer {
    x: Middle;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            x: Middle{
                y: InnerMost{ z: 123 }
            }
        };
    }
}