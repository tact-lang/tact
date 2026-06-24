struct NestedLevel2 {
    p: Bool;
}

struct NestedLevel1 {
    inner: NestedLevel2;
}

contract DeepNested {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{ inner: NestedLevel2{ p: false } };
    }
}