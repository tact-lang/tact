contract DeepNestedOptional {
    data: NestedLevel1?;

    init() {
        self.data = null;
    }
}

struct NestedLevel1 {
    level2: NestedLevel2?;
}

struct NestedLevel2 {
    level3: NestedLevel3?;
}

struct NestedLevel3 {
    value: Int?;
}
