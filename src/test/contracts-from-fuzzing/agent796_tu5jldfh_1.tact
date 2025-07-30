struct DeepNest {
    val1: Int;
    val2: Inner1;
}

struct Inner1 {
    nestedVal: Inner2;
}

struct Inner2 {
    deepVal: Int?;
}

contract TestContract {
    info: DeepNest;

    init() {
        self.info = DeepNest{
            val1: 1,
            val2: Inner1{
                nestedVal: Inner2{
                    deepVal: null
                }
            }
        };
    }
}