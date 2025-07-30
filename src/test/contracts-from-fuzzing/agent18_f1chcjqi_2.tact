struct DeepNested {
    inner: InnerNested;
}

struct InnerNested {
    x: Int;
    y: Bool?;
    z: Deepest;
}

struct Deepest {
    s: String;
    b: Bool;
}

contract NestedContract {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            inner: InnerNested{
                x: 7,
                y: null,
                z: Deepest{
                    s: "hi",
                    b: true
                }
            }
        };
    }
}