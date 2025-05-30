struct DeepNestLevel3 { z: Int; }

struct DeepNestLevel2 { y: DeepNestLevel3; }

struct DeepNestLevel1 { x: DeepNestLevel2; }

contract DeepNestedFields {
    field: DeepNestLevel1;

    init() {
        self.field = DeepNestLevel1{
            x: DeepNestLevel2{
                y: DeepNestLevel3{z: 1}
            }
        };
    }
}
