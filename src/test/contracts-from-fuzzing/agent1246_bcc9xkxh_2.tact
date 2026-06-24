struct NestedLevel2 {
    deepField: Int;
}

struct NestedLevel1 {
    inner: NestedLevel2;
}

contract DeepNestedTest {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            inner: NestedLevel2{
                deepField: 123
            }
        };
    }
}
