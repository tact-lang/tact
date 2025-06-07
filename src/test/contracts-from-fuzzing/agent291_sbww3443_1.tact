struct DeepNested {
    x: Int;
    optInner: InnerStruct?;
}

struct InnerStruct {
    y: Int;
    z: Bool;
}

contract Test {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            x: 1,
            optInner: InnerStruct{
                y: 2,
                z: true
            }
        };
    }
}