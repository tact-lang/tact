struct DeepNest3 {
    z: Int;
}

struct DeepNest2 {
    y: DeepNest3;
}

struct DeepNest1 {
    x: DeepNest2;
}

contract TestDeepNest {
    nested: DeepNest1;

    init() {
        self.nested = DeepNest1{
            x: DeepNest2{
                y: DeepNest3{
                    z: 123
                }
            }
        };
    }
}