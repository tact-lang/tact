struct DeepNestLevel3 { leaf: Int }

struct DeepNestLevel2 { nest: DeepNestLevel3 }

struct DeepNestLevel1 { nest: DeepNestLevel2 }

contract TestContract {
    deeplyNested: DeepNestLevel1;

    init() {
        self.deeplyNested = DeepNestLevel1{
            nest: DeepNestLevel2{
                nest: DeepNestLevel3{ leaf: 999 },
            },
        };
    }
}