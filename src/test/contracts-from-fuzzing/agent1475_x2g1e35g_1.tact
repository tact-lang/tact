struct NestedLevel2 {
    flag: Bool;
    count: Int;
}

struct NestedLevel1 {
    inner: NestedLevel2;
    optInt: Int?;
}

contract DeepNestedTest {
    item: NestedLevel1;

    init() {
        self.item = NestedLevel1{
            inner: NestedLevel2{
                flag: false,
                count: 123,
            },
            optInt: null,
        };
    }
}