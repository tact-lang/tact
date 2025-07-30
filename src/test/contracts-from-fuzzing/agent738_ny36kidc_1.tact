struct NestedLevel3 {
    c: Bool;
}

struct NestedLevel2 {
    b: Int?;
    inner: NestedLevel3;
}

struct NestedLevel1 {
    a: Int;
    inner: NestedLevel2;
}

contract DeepPersistentStorage {
    storage: NestedLevel1;

    init() {
        self.storage = NestedLevel1{
            a: 5,
            inner: NestedLevel2{
                b: null,
                inner: NestedLevel3{
                    c: true,
                },
            },
        };
    }
}