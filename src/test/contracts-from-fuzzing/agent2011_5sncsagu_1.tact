struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    innermost: InnerMostStruct;
    flag: Bool;
}

struct InnerMostStruct {
    val1: Int;
    val2: Int?;
    text: String;
}

contract TestDeepNested {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                innermost: InnerMostStruct{
                    val1: 42,
                    val2: null,
                    text: "hello"
                },
                flag: true
            }
        };
    }
}