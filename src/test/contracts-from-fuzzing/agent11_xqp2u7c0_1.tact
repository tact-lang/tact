struct NestedLevel3 {
    a: Int;
}

struct NestedLevel2 {
    level3: NestedLevel3;
    b: Bool;
}

struct NestedLevel1 {
    level2: NestedLevel2;
    c: Int;
    d: Bool;
}

contract DeepNestedTest {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            level2: NestedLevel2{
                level3: NestedLevel3{ a: 5 },
                b: true
            },
            c: 10,
            d: false
        };
    }
}