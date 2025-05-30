struct DeepNested {
    intVal: Int = 1;
    innerStruct: Inner;
}

struct Inner {
    boolVal: Bool = false;
    deepInner: Deeper;
}

struct Deeper {
    strVal: String = "str";
    optVal: Int?;
}

contract DeepNestMix {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            innerStruct: Inner{
                deepInner: Deeper{
                    optVal: 5
                }
            }
        };
    }
}