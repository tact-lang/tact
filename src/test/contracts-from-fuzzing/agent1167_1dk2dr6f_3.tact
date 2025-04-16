struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract Test3 {
    f: DeepNested;

    init() {
        self.f = DeepNested{
            inner: InnerStruct{
                x: 10,
                y: false,
                z: "abc",
            }
        };
    }
}