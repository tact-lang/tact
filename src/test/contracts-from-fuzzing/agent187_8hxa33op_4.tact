struct DeepNest3 {
    val: Int;
}

struct DeepNest2 {
    nest: DeepNest3;
}

struct DeepNest1 {
    nest: DeepNest2;
}

contract DeepNestedStruct {
    inner: DeepNest1;

    init() {
        self.inner = DeepNest1{
            nest: DeepNest2{
                nest: DeepNest3{
                    val: 55,
                }
            }
        };
    }
}
