struct NestedStruct {
    level1: Layer1;
}

struct Layer1 {
    level2: Layer2;
}

struct Layer2 {
    level3: Layer3;
}

struct Layer3 {
    finalVal: Int;
}

contract DeepHierarchyTest {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            level1: Layer1{
                level2: Layer2{
                    level3: Layer3{
                        finalVal: 777
                    }
                }
            }
        };
    }
}