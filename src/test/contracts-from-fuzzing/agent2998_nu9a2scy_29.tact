struct MultiLevelDefaults {
    a: Int = 1;
    b: InnerDefaults;
}

struct InnerDefaults {
    x: Int = 2;
    y: String = "hello";
}

contract MultiLevelDefaultsTest {
    val: MultiLevelDefaults;
    init() {
        self.val = MultiLevelDefaults{
            b: InnerDefaults{}
        };
    }
}