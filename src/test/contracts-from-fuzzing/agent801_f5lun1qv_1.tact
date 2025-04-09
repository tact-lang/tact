struct NestedLevel3 {
    val3: Int;
}

struct NestedLevel2 {
    inner3: NestedLevel3;
}

struct NestedLevel1 {
    inner2: NestedLevel2;
}

contract DeepNestedContract {
    field: NestedLevel1;

    init() {
        self.field = NestedLevel1{
            inner2: NestedLevel2{
                inner3: NestedLevel3{
                    val3: 123
                }
            }
        };
    }
}