struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: Bool;
    flag: Bool?;
}

contract ComplexContract {
    deep: DeepNested;

    init() {
        self.deep = DeepNested{ inner: InnerStruct{ x: 10, y: false, flag: null } };
    }
}