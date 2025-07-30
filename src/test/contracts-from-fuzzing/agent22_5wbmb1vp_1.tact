struct DeepNested {
    inner1: InnerStruct1;
}

struct InnerStruct1 {
    inner2: InnerStruct2;
}

struct InnerStruct2 {
    val: Int;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{inner1: InnerStruct1{inner2: InnerStruct2{val: 42}}};
    }
}