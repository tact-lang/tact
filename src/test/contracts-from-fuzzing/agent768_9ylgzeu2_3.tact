struct DeepInner {
    x: Int = 1;
    y: Bool = true;
}

struct MiddleInner {
    deep: DeepInner;
}

struct OuterStruct {
    mid: MiddleInner;
}

contract DeepNestedStruct {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{
            mid: MiddleInner{
                deep: DeepInner{
                    x: 42,
                    y: false,
                }
            }
        };
    }
}
