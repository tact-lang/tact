struct DeepLevel3 {
    val: Int;
}

struct DeepLevel2 {
    deeper: DeepLevel3;
}

struct DeepLevel1 {
    inner: DeepLevel2;
}

contract TestContract {
    field: DeepLevel1;

    init() {
        self.field = DeepLevel1{
            inner: DeepLevel2{
                deeper: DeepLevel3{
                    val: 777
                }
            }
        };
    }
}