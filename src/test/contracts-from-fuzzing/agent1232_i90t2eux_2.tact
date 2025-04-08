struct NestedLevel2 {
    value: Int?;
    flag: Bool;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    note: String;
}

contract DeepNestedTest {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            inner: NestedLevel2{
                value: 123,
                flag: true,
            },
            note: "deepness",
        };
    }
}