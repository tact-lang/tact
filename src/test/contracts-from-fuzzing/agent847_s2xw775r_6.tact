struct DeepNestedOptional {
    level1: DeepNestedOptional2?;
}

struct DeepNestedOptional2 {
    level2: DeepNestedOptional3?;
}

struct DeepNestedOptional3 {
    val: Int?;
}

contract DeepOptionalDepthTest {
    data: DeepNestedOptional;

    init() {
        self.data = DeepNestedOptional{ level1: null };
    }
}