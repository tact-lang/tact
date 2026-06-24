struct NestedLevel2 {
    a: Int;
    b: Int?;
}

struct NestedLevel1 {
    nested: NestedLevel2;
    flag: Bool;
}

contract NestedStorageContract {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            nested: NestedLevel2{ a: 7, b: null },
            flag: true
        };
    }
}