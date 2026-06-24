struct DeepNested {
    x: Int;
    y: String;
}

struct MidNested {
    inA: DeepNested;
    inB: DeepNested;
}

struct Outer {
    mn1: MidNested;
    mn2: MidNested;
}

contract TestNested {
    nestedField: Outer;
    
    init() {
        self.nestedField = Outer{
            mn1: MidNested{
                inA: DeepNested{ x: 1, y: "a" },
                inB: DeepNested{ x: 2, y: "b" }
            },
            mn2: MidNested{
                inA: DeepNested{ x: 3, y: "c" },
                inB: DeepNested{ x: 4, y: "d" }
            }
        };
    }
}