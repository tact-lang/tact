struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    optStr: String?;
    data: DataLayer;
}

struct DataLayer {
    content: String;
    num: Int?;
}

contract DeepStorage {
    persistent: DeepNested;

    init() {
        self.persistent = DeepNested{
            inner: InnerStruct{
                flag: true,
                optStr: null,
                data: DataLayer{
                    content: "content",
                    num: null,
                },
            },
        };
    }
}
