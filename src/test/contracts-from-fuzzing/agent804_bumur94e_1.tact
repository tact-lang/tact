struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    level2: Level2Struct;
}

struct Level2Struct {
    x: Int;
    y: Bool;
    text: String;
}

contract TestContract {
    data: DeeplyNested;
    
    init() {
        self.data = DeeplyNested{
            inner: InnerStruct{
                level2: Level2Struct{
                    x: 1,
                    y: true,
                    text: "hi"
                }
            }
        };
    }
}
