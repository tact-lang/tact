struct NestedLevel3 {
    d: Int;
    e: Bool;
}

struct NestedLevel2 {
    c: String;
    nested3: NestedLevel3;
}

struct NestedLevel1 {
    a: Int;
    b: NestedLevel2;
}

contract DeepNestedTest {
    data: NestedLevel1;
    init() {
        self.data = NestedLevel1{
            a: 1,
            b: NestedLevel2{
                c: "str",
                nested3: NestedLevel3{
                    d: 42,
                    e: true
                }
            }
        };
    }
}