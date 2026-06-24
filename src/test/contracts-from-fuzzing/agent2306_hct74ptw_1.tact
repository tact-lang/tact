struct NestedLevel3 { z: Int; }

struct NestedLevel2 {
    c: Int;
    d: NestedLevel3;
}

struct NestedLevel1 {
    a: Int;
    b: NestedLevel2;
}

contract DeepNestedStorage {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            a: 1,
            b: NestedLevel2{
                c: 2,
                d: NestedLevel3{ z: 3 }
            }
        };
    }
}
