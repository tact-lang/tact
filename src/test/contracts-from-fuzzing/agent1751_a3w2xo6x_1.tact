struct DeepNestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    num: Int;
    flag: Bool;
}

contract NestedOptionalsTest {
    val: DeepNestedOptional;

    init() {
        self.val = DeepNestedOptional{ inner: InnerStruct{ num: 1, flag: true } };
    }
}
