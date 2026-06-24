struct DeepNested {
    innermost: InnerStruct;
}

struct InnerStruct {
    x: Int = 5;
    y: Bool = true;
}

contract TestContract {
    deep: DeepNested = DeepNested{ innermost: InnerStruct{} };
    init() {}
    receive() {}
}