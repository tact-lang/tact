struct DeepNested {
    val: Int;
    optionalInner: MiddleNested?;
}

struct MiddleNested {
    flag: Bool;
    inner: InnerMostNested;
}

struct InnerMostNested {
    value: Int?;
    flag: Bool;
}

contract TestDeepStorage {
    store: DeepNested;
    init() {
        self.store = DeepNested{
            val: 100,
            optionalInner: MiddleNested{
                flag: true,
                inner: InnerMostNested{
                    value: 777,
                    flag: false
                }
            }
        };
    }
}