struct DeepNested {
    inner: Int;
    optInner: Int?;
    deeper: DeeperNested;
}

struct DeeperNested {
    flag: Bool;
    val: Int;
    maybe: Bool?;
}

contract StorageTest {
    dn: DeepNested;

    init() {
        self.dn = DeepNested{
            inner: 1,
            optInner: null,
            deeper: DeeperNested{
                flag: true,
                val: 10,
                maybe: false,
            },
        };
    }
}