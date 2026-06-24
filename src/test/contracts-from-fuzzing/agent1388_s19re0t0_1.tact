struct NestedLevel3 {
    flag: Bool;
    note: String;
}

struct NestedLevel2 {
    count: Int;
    deep: NestedLevel3;
}

struct NestedLevel1 {
    id: Int;
    inner: NestedLevel2;
}

contract DeepNestedStorage {
    record: NestedLevel1;

    init() {
        self.record = NestedLevel1{
            id: 1,
            inner: NestedLevel2{
                count: 2,
                deep: NestedLevel3{
                    flag: true,
                    note: "ok"
                }
            }
        };
    }
}
