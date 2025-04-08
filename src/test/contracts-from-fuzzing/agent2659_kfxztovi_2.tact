struct NestedLevel3 {
    deep: Int;
    flag: Bool;
}

struct NestedLevel2 {
    mid: Int;
    inner: NestedLevel3;
}

struct NestedLevel1 {
    outer: Int;
    inner: NestedLevel2;
}

contract DeepNested {
    store: NestedLevel1;

    init() {
        self.store = NestedLevel1{
            outer: 1,
            inner: NestedLevel2{
                mid: 2,
                inner: NestedLevel3{
                    deep: 3,
                    flag: true,
                }
            }
        };
    }
}