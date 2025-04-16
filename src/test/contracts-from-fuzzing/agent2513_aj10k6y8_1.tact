struct NestedDepth3 {
    val: Int;
}

struct NestedDepth2 {
    inner: NestedDepth3;
}

struct NestedDepth1 {
    inner: NestedDepth2;
}

contract DeepNestTest {
    deep: NestedDepth1;

    init() {
        self.deep = NestedDepth1{ inner: NestedDepth2{ inner: NestedDepth3{ val: 42 } } };
    }
}