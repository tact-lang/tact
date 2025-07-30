struct DeepNest1 {
    x: Int;
}
struct DeepNest2 {
    nest: DeepNest1;
}
struct DeepNest3 {
    nest: DeepNest2;
}
struct DeepNest4 {
    nest: DeepNest3;
}
struct DeepNest5 {
    nest: DeepNest4;
}

contract Test {
    foo: DeepNest5;
    init() {
        self.foo = DeepNest5{
            nest: DeepNest4{
                nest: DeepNest3{
                    nest: DeepNest2{
                        nest: DeepNest1{ x: 123 }
                    }
                }
            }
        };
    }
}