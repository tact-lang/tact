struct DeepNested {
    inner: NestedLevel1;
}

struct NestedLevel1 {
    inner: NestedLevel2;
}

struct NestedLevel2 {
    val: Int;
}

contract DeepNestTest {
    deep: DeepNested = DeepNested{ inner: NestedLevel1{ inner: NestedLevel2{ val: 42 } } };
}