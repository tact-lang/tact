struct DeepInner {
    val: Int?;
}

struct MidInner {
    deep: DeepInner?;
}

struct Outer {
    mid: MidInner?;
}

contract ChainOptionStruct {
    data: Outer;

    init() {
        self.data = Outer{
            mid: MidInner{
                deep: DeepInner{
                    val: null
                }
            }
        };
    }
}