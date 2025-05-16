struct DeepInner {
    z: Int;
}

struct MidInner {
    y: Int;
    deep: DeepInner;
}

struct DeepOuter {
    x: Int;
    mid: MidInner;
}

contract DeepNest {
    obj: DeepOuter;

    init() {
        self.obj = DeepOuter{
            x: 1,
            mid: MidInner{
                y: 2,
                deep: DeepInner{
                    z: 3
                }
            }
        };
    }
}
