struct DeepNested {
    sub: SubStruct;
    flag: Bool;
}

struct SubStruct {
    val: Int;
    inner: InnerStruct?;
}

struct InnerStruct {
    message: String;
    cellData: Cell?;
}

contract Test {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            sub: SubStruct{
                val: 10,
                inner: null,
            },
            flag: false,
        };
    }
}