struct NestedLevel3 {
    v3: Int;
}

struct NestedLevel2 {
    v2: NestedLevel3;
}

struct NestedLevel1 {
    v1: NestedLevel2;
}

contract TestContract {
    deeplyNested: NestedLevel1;

    init() {
        self.deeplyNested = NestedLevel1{
            v1: NestedLevel2{
                v2: NestedLevel3{v3: 42}
            }
        };
    }
}