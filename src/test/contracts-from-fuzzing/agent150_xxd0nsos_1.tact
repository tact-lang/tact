struct DeepNested {
    inner: MidNested;
}

struct MidNested {
    inner: LowNested;
}

struct LowNested {
    val: Int;
    optVal: Bool?;
}

contract NestedStorage {
    deeplyNested: DeepNested;

    init() {
        self.deeplyNested = DeepNested{
            inner: MidNested{
                inner: LowNested{
                    val: 123,
                    optVal: true
                }
            }
        };
    }
}