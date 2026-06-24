struct DeepNested {
    a: Int;
    b: String?;
    c: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: InnerMost;
}

struct InnerMost {
    flag: Bool;
    note: String?;
}

contract LayerStack {
    deepValue: DeepNested;

    init() {
        self.deepValue = DeepNested{
            a: 5,
            b: null,
            c: InnerStruct{
                x: 9,
                y: InnerMost{
                    flag: false,
                    note: "deep"
                }
            }
        };
    }
}