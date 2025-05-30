struct DeeplyLayered {
    x: Int;
    y: Int;
    z: DeepInner;
}

struct DeepInner {
    a: Int;
    b: InnerMost2;
}

struct InnerMost2 {
    num: Int;
    strVal: String?;
}

contract MultiDeepFields {
    val: DeeplyLayered;
    init() {
        self.val = DeeplyLayered{
            x: 1,
            y: 2,
            z: DeepInner{
                a: 3,
                b: InnerMost2{
                    num: 4,
                    strVal: null
                }
            }
        };
    }
}