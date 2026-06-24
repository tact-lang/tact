struct NestedOptionalLevel2 {
    level2val: Int?;
}

struct NestedOptionalLevel1 {
    level1val: NestedOptionalLevel2?;
}

contract NullableNestedOptions {
    data: NestedOptionalLevel1?;

    init() {
        self.data = null;
    }
}