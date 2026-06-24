struct NestedLevel2 {
    val: Int;
}

struct NestedLevel1 {
    inner: NestedLevel2;
}

contract DeeplyNestedContract {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{
            inner: NestedLevel2{
                val: 42
            }
        };
    }
}
