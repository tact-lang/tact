struct NestedLevel2 {
    value: Int;
}

struct NestedLevel1 {
    inner: NestedLevel2;
}

contract TestContract {
    container: NestedLevel1;
    init() {
        self.container = NestedLevel1{ inner: NestedLevel2{ value: 99 } };
    }
}