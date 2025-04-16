struct InnerStruct {
    val: Int;
}

struct WrapperA {
    a: InnerStruct;
}

struct WrapperB {
    b: WrapperA;
}

struct WrapperC {
    c: WrapperB;
}

contract NestedWrappers {
    nested: WrapperC;

    init() {
        self.nested = WrapperC{
            c: WrapperB{
                b: WrapperA{
                    a: InnerStruct{
                        val: 7
                    }
                }
            }
        };
    }
}
