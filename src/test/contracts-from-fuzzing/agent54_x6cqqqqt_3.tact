struct DeepNest3 {
    val3: Int;
}

struct DeepNest2 {
    val2: DeepNest3;
}

struct DeepNest1 {
    val1: DeepNest2;
}

contract TestContract {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            val1: DeepNest2{
                val2: DeepNest3{
                    val3: 7
                }
            }
        };
    }
}