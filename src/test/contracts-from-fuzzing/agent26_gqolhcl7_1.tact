struct DeepNest3 {
    val3: Int;
}

struct DeepNest2 {
    nest3: DeepNest3;
}

struct DeepNest1 {
    nest2: DeepNest2;
}

contract TestContract {
    nested: DeepNest1;

    init() {
        self.nested = DeepNest1{
            nest2: DeepNest2{
                nest3: DeepNest3{
                    val3: 10
                }
            }
        };
    }
}
