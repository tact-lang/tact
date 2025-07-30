struct NestedStructLevel3 { z: Int; }
struct NestedStructLevel2 { y: NestedStructLevel3; }
struct NestedStructLevel1 { x: NestedStructLevel2; }

contract DeepNestedTest {
    nested: NestedStructLevel1;

    init() {
        self.nested = NestedStructLevel1{
            x: NestedStructLevel2{
                y: NestedStructLevel3{
                    z: 42
                }
            }
        };
    }
}
