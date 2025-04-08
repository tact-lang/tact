struct DeepNest1 {
    val: Int;
}
struct DeepNest2 {
    nest1: DeepNest1;
}
struct DeepNest3 {
    nest2: DeepNest2;
}
struct DeepNest4 {
    nest3: DeepNest3;
}
struct DeepNest5 {
    nest4: DeepNest4;
}
contract DeepNesting {
    f: DeepNest5;
    init() {
        self.f = DeepNest5{
            nest4: DeepNest4{
                nest3: DeepNest3{
                    nest2: DeepNest2{
                        nest1: DeepNest1{
                            val: 999
                        }
                    }
                }
            }
        };
    }
}