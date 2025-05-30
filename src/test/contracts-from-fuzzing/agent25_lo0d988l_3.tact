struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    message: String;
}

contract TestContract {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            inner: InnerStruct{
                flag: false,
                message: "deep",
            },
        };
    }
}