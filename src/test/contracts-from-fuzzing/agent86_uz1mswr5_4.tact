struct DeepNested {
    s1: StructLevel1;
}

struct StructLevel1 {
    s2: StructLevel2;
}

struct StructLevel2 {
    flag: Bool;
}

contract DeepNestedTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            s1: StructLevel1{
                s2: StructLevel2{
                    flag: true
                }
            }
        };
    }
}