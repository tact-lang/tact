struct RecursiveLevel3 {
    val: Int;
}

struct RecursiveLevel2 {
    inner: RecursiveLevel3;
}

struct RecursiveLevel1 {
    deep: RecursiveLevel2;
}

contract DeepNestedChain {
    data: RecursiveLevel1;

    init() {
        self.data = RecursiveLevel1{
            deep: RecursiveLevel2{
                inner: RecursiveLevel3{
                    val: 123
                }
            }
        };
    }
}