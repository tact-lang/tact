struct NestedContractStruct {
    s1: NestedInner;
}

struct NestedInner {
    s2: NestedInnerMost;
}

struct NestedInnerMost {
    x: Int;
}

contract NestedStructContract {
    storage: NestedContractStruct;
    init() {
        self.storage = NestedContractStruct{
            s1: NestedInner{
                s2: NestedInnerMost{
                    x: 42
                }
            }
        };
    }
}