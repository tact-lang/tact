struct NestedLevel3 {
    a: Int;
}

struct NestedLevel2 {
    inner3: NestedLevel3;
}

struct NestedLevel1 {
    inner2: NestedLevel2;
}

contract DeepNestedField {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            inner2: NestedLevel2{
                inner3: NestedLevel3{ a: 99 }
            }
        };
    }
}