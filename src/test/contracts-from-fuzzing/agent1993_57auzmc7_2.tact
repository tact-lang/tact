struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    num: Int;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{ inner: InnerStruct{ flag: true, num: 42 } };
    }
}