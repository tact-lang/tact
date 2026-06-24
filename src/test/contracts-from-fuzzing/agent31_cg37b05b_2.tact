struct NestedLevel3 {
    deep: Int;
}

struct NestedLevel2 {
    inner: NestedLevel3;
}

struct NestedLevel1 {
    level2: NestedLevel2;
}

contract DeepNestedContract {
    persistent: NestedLevel1;

    init() {
        self.persistent = NestedLevel1{
            level2: NestedLevel2{
                inner: NestedLevel3{
                    deep: 777
                }
            }
        };
    }
}