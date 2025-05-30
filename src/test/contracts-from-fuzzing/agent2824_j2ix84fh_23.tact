struct NestedLevel1 { x: Int }
struct NestedLevel2 { y: NestedLevel1 }
struct NestedLevel3 { z: NestedLevel2 }

contract DeepThree {
    info: NestedLevel3;

    init() {
        self.info = NestedLevel3{ z: NestedLevel2{ y: NestedLevel1{ x: 55 } } };
    }
}