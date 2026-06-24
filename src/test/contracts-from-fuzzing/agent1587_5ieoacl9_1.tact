struct DeepNest {
    inner: InnerStruct;
}

struct InnerStruct {
    subInner: SubInnerStruct;
}

struct SubInnerStruct {
    x: Int;
    flag: Bool;
    note: String?;
}

contract DeepStorage {
    dn: DeepNest;

    init() {
        self.dn = DeepNest{
            inner: InnerStruct{
                subInner: SubInnerStruct{
                    x: 42,
                    flag: true,
                    note: null,
                }
            }
        };
    }
}