struct DeepNested {
    inner1: Int?;
    inner2: Int;
}

struct MiddleNested {
    mid: DeepNested?;
    plain: Int;
}

contract DeepNestedContract {
    nested: MiddleNested?;

    init() {
        self.nested = null;
    }
}