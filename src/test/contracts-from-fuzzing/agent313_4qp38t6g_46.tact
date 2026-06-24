struct NestedStringDefs {
    s1: String = "a";
    s2: String = "b";
}

contract NestedStringDefaultsTest {
    inner: NestedStringDefs = NestedStringDefs{};

    init() {
        self.inner = NestedStringDefs{};
    }
}