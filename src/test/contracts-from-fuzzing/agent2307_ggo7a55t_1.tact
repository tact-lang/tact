struct DeepNested {
    inner: NestedStruct?;
}

struct NestedStruct {
    x: Int;
    y: Int?;
    z: InnerMost;
}

struct InnerMost {
    flag: Bool;
    s: String;
}

contract TestContract {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            inner: NestedStruct{
                x: 1,
                y: null,
                z: InnerMost{
                    flag: true,
                    s: "abc"
                }
            }
        };
    }
}
