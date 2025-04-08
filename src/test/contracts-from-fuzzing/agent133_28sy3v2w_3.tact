struct NestedLevel3 {
    k: Int;
    m: Bool?;
    s: String?;
}

struct NestedLevel2 {
    l3a: NestedLevel3;
    l3b: NestedLevel3;
    active: Bool;
}

struct NestedLevel1 {
    l2: NestedLevel2;
    id: Int?;
}

contract TestContract {
    storage: NestedLevel1;
    init() {
        self.storage = NestedLevel1{
            l2: NestedLevel2{
                l3a: NestedLevel3{ k: 1, m: null, s: null },
                l3b: NestedLevel3{ k: 2, m: true, s: "foo" },
                active: true
            },
            id: null
        };
    }
}