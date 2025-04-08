struct DeepNested {
    number: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    detail: DeeperStruct;
}

struct DeeperStruct {
    message: String;
    optionalInt: Int?;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            number: 10,
            inner: InnerStruct{
                flag: true,
                detail: DeeperStruct{ message: "hi", optionalInt: 123 }
            }
        };
    }
}