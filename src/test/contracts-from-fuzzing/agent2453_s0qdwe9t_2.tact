struct DeepNested {
    d1: Int;
    d2: Bool?;
    d3: String;
}

struct Middle {
    m1: Int;
    m2: DeepNested;
}

struct Outer {
    o1: Bool;
    o2: Middle;
}

contract MultiNested {
    field: Outer;
    init() {
        self.field = Outer{
            o1: true,
            o2: Middle{
                m1: 5,
                m2: DeepNested{
                    d1: 7,
                    d2: false,
                    d3: "test"
                }
            }
        };
    }
}