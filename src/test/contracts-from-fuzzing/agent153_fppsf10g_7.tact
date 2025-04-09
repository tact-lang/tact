struct DeepNestLevel3 { value3: Int; }

struct DeepNestLevel2 { level3: DeepNestLevel3; }

struct DeepNestLevel1 { level2: DeepNestLevel2; }

struct DeepNestRoot { level1: DeepNestLevel1; }

contract DeeplyNested {
    root: DeepNestRoot;

    init() {
        self.root = DeepNestRoot{
            level1: DeepNestLevel1{
                level2: DeepNestLevel2{
                    level3: DeepNestLevel3{value3: 777}
                }
            }
        };
    }

    receive() {
        self.root.level1.level2.level3.value3 += 1;
    }
}