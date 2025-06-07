struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    label: String;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                flag: false,
                label: "deep"
            }
        };
    }
}