struct NestedLevel2 {
    z: Int?;
}

struct NestedLevel1 {
    y: NestedLevel2;
}

contract DeepNestedTest {
    nested: NestedLevel1;

    init() {
        self.nested = NestedLevel1{ y: NestedLevel2{ z: 100 } };
    }

    receive() {}
}