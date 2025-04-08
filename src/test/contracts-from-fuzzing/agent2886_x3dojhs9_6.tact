struct NestedLevel3 {
    z: Int;
}

struct NestedLevel2 {
    y: NestedLevel3;
}

struct NestedLevel1 {
    x: NestedLevel2;
}

contract DeepDeepNesting {
    data: NestedLevel1;
    init() {
        self.data = NestedLevel1{ x: NestedLevel2{ y: NestedLevel3{ z: 999 } } };
    }
}