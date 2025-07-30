struct NestedLevel3 { z: Int; }
struct NestedLevel2 { y: NestedLevel3; }
struct NestedLevel1 { x: NestedLevel2; }

contract DeepHierarchyTest {
    state: NestedLevel1;

    init() {
        self.state = NestedLevel1{ x: NestedLevel2{ y: NestedLevel3{ z: 123 } } };
    }

    receive() {
        self.state;
    }
}