struct NestLevel3 {
    deepVal: Bool;
}

struct NestLevel2 {
    level3: NestLevel3;
}

struct NestLevel1 {
    level2: NestLevel2;
}

contract DeepNestTest {
    nestedField: NestLevel1;

    init() {
        self.nestedField = NestLevel1{
            level2: NestLevel2{
                level3: NestLevel3{
                    deepVal: true
                }
            }
        };
    }
}
