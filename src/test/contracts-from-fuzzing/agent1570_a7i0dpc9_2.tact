struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    val: Int;
}

contract TestContract {
    deep: DeepNested;
    
    init() {
        self.deep = DeepNested{ inner: InnerStruct{ val: 42 } };
    }
}