struct DeepNested3 {
    val: Int;
}

struct DeepNested2 {
    inner: DeepNested3;
}

struct DeepNested1 {
    inner: DeepNested2;
}

contract VeryDeepNested {
    root: DeepNested1;

    init() {
        self.root = DeepNested1{
            inner: DeepNested2{
                inner: DeepNested3{
                    val: 999
                }
            }
        };
    }
}
