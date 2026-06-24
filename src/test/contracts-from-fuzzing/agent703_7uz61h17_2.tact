struct NestedLevel2 {
    b: Bool;
    c: String;
}

struct NestedLevel1 {
    a: Int;
    nested: NestedLevel2;
}

contract DeepNestedTest {
    param: NestedLevel1;

    init() {
        self.param = NestedLevel1{
            a: 42,
            nested: NestedLevel2{
                b: true,
                c: "test"
            }
        };
    }
}