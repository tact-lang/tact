struct DeeplyNested {
    val: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    innerMost: InnermostStruct;
}

struct InnermostStruct {
    text: String;
}

contract TestDeepStruct {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            val: 1,
            inner: InnerStruct{
                flag: true,
                innerMost: InnermostStruct{ text: "hello" }
            }
        };
    }
}