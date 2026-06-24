struct DeepNested {
    x: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    y: Int;
    z: String?;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            x: 7,
            inner: InnerStruct{ y: 8, z: null },
        };
    }
}