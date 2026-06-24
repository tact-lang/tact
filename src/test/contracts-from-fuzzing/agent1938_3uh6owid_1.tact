struct DeepNestedLevel3 { z: Int; }

struct DeepNestedLevel2 { y: DeepNestedLevel3; }

struct DeepNestedLevel1 { x: DeepNestedLevel2; }

contract NestedTest {
    nested: DeepNestedLevel1;

    init() {
        self.nested = DeepNestedLevel1{
            x: DeepNestedLevel2{
                y: DeepNestedLevel3{ z: 10 }
            }
        };
    }
}