struct DeepNestLevel3 { value3: Int; }
struct DeepNestLevel2 { inner3: DeepNestLevel3; }
struct DeepNestLevel1 { inner2: DeepNestLevel2; }

contract NestTest {
    nested: DeepNestLevel1;

    init() {
        self.nested = DeepNestLevel1{
            inner2: DeepNestLevel2{
                inner3: DeepNestLevel3{
                    value3: 123
                }
            }
        };
    }
}