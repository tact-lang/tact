struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    deep: DeepStruct;
}

struct DeepStruct {
    val: Int;
    flag: Bool;
    text: String;
}

contract MultiLevelNested {
    sfield: NestedStruct;
    
    init() {
        self.sfield = NestedStruct{
            inner: InnerStruct{
                deep: DeepStruct{
                    val: 1,
                    flag: false,
                    text: "ok",
                },
            },
        };
    }
}