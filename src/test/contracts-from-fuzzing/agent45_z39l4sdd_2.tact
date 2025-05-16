struct DeepNestLevel3 {
    innermost: Int;
}

struct DeepNestLevel2 {
    inner: DeepNestLevel3;
}

struct DeepNestLevel1 {
    nested: DeepNestLevel2;
}

contract DeepNestTest {
    payload: DeepNestLevel1;

    init() {
        self.payload = DeepNestLevel1{
            nested: DeepNestLevel2{
                inner: DeepNestLevel3{
                    innermost: 42,
                }
            }
        };
    }
}