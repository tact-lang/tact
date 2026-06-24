struct NestedLevel3 {
    d: Int;
    optD: String?;
}

struct NestedLevel2 {
    c: Bool;
    obj3: NestedLevel3;
}

struct NestedLevel1 {
    b: Int;
    obj2: NestedLevel2;
}

contract Test {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            b: 5,
            obj2: NestedLevel2{
                c: true,
                obj3: NestedLevel3{
                    d: 10,
                    optD: null,
                },
            },
        };
    }
}