struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    num: Int;
    opt: InnerMost?;
}

struct InnerMost {
    flag: Bool;
    text: String;
}

contract TestContract {
    data: DeepNested;
    
    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                num: 1,
                opt: InnerMost{
                    flag: true,
                    text: "hi"
                }
            }
        };
    }
}