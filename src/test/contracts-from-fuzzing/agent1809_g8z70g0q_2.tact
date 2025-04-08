struct DeepNest1 {
    val1: Int;
}

struct DeepNest2 {
    nest1: DeepNest1;
}

struct DeepNest3 {
    nest2: DeepNest2;
}

contract DeepNestedContract {
    field: DeepNest3;

    init() {
        self.field = DeepNest3{
            nest2: DeepNest2{
                nest1: DeepNest1{
                    val1: 123
                }
            }
        };
    }
}