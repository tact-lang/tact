struct DeepNested1 {
    val: Int;
}

struct DeepNested2 {
    inner: DeepNested1;
}

struct DeepNested3 {
    nest: DeepNested2;
}

contract DeepNestTest {
    storage: DeepNested3;

    init() {
        self.storage = DeepNested3{
            nest: DeepNested2{
                inner: DeepNested1{
                    val: 42
                }
            }
        };
    }
}