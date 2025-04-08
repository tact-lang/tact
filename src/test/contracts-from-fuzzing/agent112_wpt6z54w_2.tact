struct DeepNested {
    inner: InnerStruct;
    intVal: Int;
}

struct InnerStruct {
    boolVal: Bool;
    stringVal: String;
}

contract TestContract {
    complexField: DeepNested;
    
    init() {
        self.complexField = DeepNested{
            inner: InnerStruct{
                boolVal: false,
                stringVal: "abc"
            },
            intVal: 42
        };
    }
}