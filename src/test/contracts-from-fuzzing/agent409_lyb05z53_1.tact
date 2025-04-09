struct DeepNested {
    innermost: Int;
}

struct NestedLevel2 {
    inner: DeepNested;
}

struct NestedLevel1 {
    inner: NestedLevel2;
}

contract DeepContract {
    val: NestedLevel1;

    init() {
        self.val = NestedLevel1{
            inner: NestedLevel2{
                inner: DeepNested{ innermost: 42 }
            }
        };
    }
}