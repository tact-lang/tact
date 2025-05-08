struct DeepNested {
    level: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    val: Int?;
}

contract TestContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            level: 10,
            inner: InnerStruct{ flag: true, val: null }
        };
    }
}
