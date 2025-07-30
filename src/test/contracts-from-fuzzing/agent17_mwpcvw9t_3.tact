struct DeepInner {
    val: Int;
}

struct Middle {
    deep: DeepInner;
}

contract DeepNestedTest {
    nested: Middle = Middle{deep: DeepInner{val: 1}};
}