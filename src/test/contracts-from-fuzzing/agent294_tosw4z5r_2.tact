struct InnerMost {
    z: Int = 77;
    y: Bool?;
}

struct Middle {
    a: InnerMost;
    b: Int?;
}

struct Outer {
    m: Middle;
}

contract DeepNested {
    field: Outer = Outer{
        m: Middle{
            a: InnerMost{
                y: true
            }
        }
    };
}
