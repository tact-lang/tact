struct DeepNested {
    f1: Int;
    f2: InnerStruct;
}

struct InnerStruct {
    a: Bool;
    b: InnerMost;
}

struct InnerMost {
    x: String;
    y: Int?;
}

contract TestContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            f1: 1,
            f2: InnerStruct{
                a: true,
                b: InnerMost{
                    x: "abc",
                    y: null,
                }
            }
        };
    }
}
