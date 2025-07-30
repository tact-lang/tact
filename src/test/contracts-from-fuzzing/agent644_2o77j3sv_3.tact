struct DeepNested3 {
    deepVal: Int;
}

struct DeepNested2 {
    inner3: DeepNested3;
}

struct DeepNested1 {
    inner2: DeepNested2;
}

contract DeepNestTest {
    nested: DeepNested1;

    init() {
        self.nested = DeepNested1{
            inner2: DeepNested2{
                inner3: DeepNested3{ deepVal: 777 }
            }
        };
    }
}