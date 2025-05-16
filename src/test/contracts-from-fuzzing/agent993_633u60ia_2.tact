struct DeeplyNested {
    x: Int;
    inner: StructB;
}

struct StructB {
    flag: Bool;
    nestedInner: StructC;
}

struct StructC {
    value: Int;
}

contract TestContract {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            x: 11,
            inner: StructB{
                flag: true,
                nestedInner: StructC{
                    value: 77
                }
            }
        };
    }
}