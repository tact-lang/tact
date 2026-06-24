struct NestedLevel3 {
    d: Int;
}

struct NestedLevel2 {
    c: NestedLevel3;
}

struct NestedLevel1 {
    b: NestedLevel2;
}

contract DeepNestedTest {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            b: NestedLevel2{
                c: NestedLevel3{
                    d: 7
                }
            }
        };
    }
}
