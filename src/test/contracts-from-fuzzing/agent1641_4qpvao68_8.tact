struct InnerMost {
    a: Int;
}

struct MidLevel {
    x: Int;
    y: InnerMost;
}

struct Outer {
    flag: Bool;
    nested: MidLevel;
}

contract DeepStruct {
    field: Outer = Outer{
        flag: true,
        nested: MidLevel{
            x: 5,
            y: InnerMost{a: 9}
        }
    };

    init() {
        self.field = Outer{
            flag: false,
            nested: MidLevel{
                x: 10,
                y: InnerMost{a: 18}
            }
        };
    }
}