struct DeepOptLevelTwo {
    val: Int;
}

struct NestedOptLevelOne {
    inner: DeepOptLevelTwo?;
}

contract NestedOptionalStruct {
    s: NestedOptLevelOne;
    init() {
        self.s = NestedOptLevelOne{ inner: null };
    }
}