struct VeryDeepNested {
    inner: DeepStruct;
    
    optionalInner: DeepStruct?;
}

struct DeepStruct {
    s1: InnerStruct;
    s2: InnerStruct;
}

struct InnerStruct {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract DeepNestedTest {
    nested: VeryDeepNested;

    init() {
        self.nested = VeryDeepNested{
            inner: DeepStruct{
                s1: InnerStruct{ f1: 1, f2: true, f3: "x" },
                s2: InnerStruct{ f1: 2, f2: false, f3: "y" }
            },
            optionalInner: null
        };
    }
}