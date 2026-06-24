struct DeepInner {
    val: Int;
}

struct MidLevel {
    inner: DeepInner;
}

struct Outer {
    mid: MidLevel;
}

contract DeepNestedStorage {
    deep: Outer;

    init() {
        self.deep = Outer{
            mid: MidLevel{
                inner: DeepInner{
                    val: 42
                }
            }
        };
    }
}