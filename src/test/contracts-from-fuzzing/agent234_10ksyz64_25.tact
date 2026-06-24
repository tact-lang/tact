struct NestedMixed {
    optVal: Int?;
    inner: InnerStr;
}

struct InnerStr {
    val: Int;
    optStr: String?;
}

contract NestedMixedTest {
    data: NestedMixed;

    init() {
        self.data = NestedMixed{
            optVal: null,
            inner: InnerStr{ val: 1, optStr: "world" }
        };
    }
}