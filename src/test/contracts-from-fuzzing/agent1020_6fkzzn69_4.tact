struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
    val3: SubInner;
}

struct SubInner {
    flag: Bool;
    text: String;
}

contract TestDeep {
    f: DeepNested;

    init() {
        self.f = DeepNested{
            inner: InnerStruct{
                val1: 7,
                val2: false,
                val3: SubInner{
                    flag: true,
                    text: "deep"
                }
            }
        };
    }
}
