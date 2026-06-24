struct DeepNested {
    inner: InnerNested;
}

struct InnerNested {
    field: Bool;
}

contract TestContract {
    deep: DeepNested;
    
    init() {
        self.deep = DeepNested{inner: InnerNested{field: false}};
    }
}