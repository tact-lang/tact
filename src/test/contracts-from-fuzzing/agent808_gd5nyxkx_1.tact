struct DeepNest3 {
    val3: Int;
}

struct DeepNest2 {
    nest3: DeepNest3;
}

struct DeepNest1 {
    nest2: DeepNest2;
}

contract TestDeepNesting {
    deepNest: DeepNest1;
    
    init() {
        self.deepNest = DeepNest1{
            nest2: DeepNest2{
                nest3: DeepNest3{
                    val3: 123
                }
            }
        };
    }
}
