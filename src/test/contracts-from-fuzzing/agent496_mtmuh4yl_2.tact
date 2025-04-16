struct DeepNest {
    a: Int;
    b: Int?;
    inner: InnerStruct;
}

struct InnerStruct {
    z: Int;
    y: Int?;
}

contract TestContract {
    data: DeepNest;

    init() {
        self.data = DeepNest{
            a: 1,
            b: null,
            inner: InnerStruct{
                z: 2,
                y: null,
            }
        };
    }
}