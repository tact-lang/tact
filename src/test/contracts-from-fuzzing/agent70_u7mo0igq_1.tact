struct DeepNested {
    val1: Int;
    val2: InnerStruct;
}

struct InnerStruct {
    valInner: Int;
    sub: SubInner;
}

struct SubInner {
    optVal: Bool?;
    strVal: String;
}

contract TestContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            val1: 1,
            val2: InnerStruct{
                valInner: 2,
                sub: SubInner{
                    optVal: null,
                    strVal: "Hi"
                }
            }
        };
    }
}