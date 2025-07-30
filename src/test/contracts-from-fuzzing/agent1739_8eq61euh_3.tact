struct DeepNestLevel1 {
    val1: Int;
    inner: DeepNestLevel2;
}

struct DeepNestLevel2 {
    val2: Bool;
    innermost: DeepNestLevel3;
}

struct DeepNestLevel3 {
    flag: Bool;
    number: Int;
}

contract Test {
    deep: DeepNestLevel1;

    init() {
        self.deep = DeepNestLevel1{
            val1: 1,
            inner: DeepNestLevel2{
                val2: true,
                innermost: DeepNestLevel3{
                    flag: false,
                    number: 42
                }
            }
        };
    }
}
