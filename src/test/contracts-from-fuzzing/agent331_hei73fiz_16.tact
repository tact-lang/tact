struct DeepNest3 { 
    z: Int;
}

struct DeepNest2 {
    y: DeepNest3;
}

struct DeepNest1 {
    x: DeepNest2;
}

contract DeepDeepNest {
    value: DeepNest1;

    init() {
        self.value = DeepNest1{
            x: DeepNest2{
                y: DeepNest3{z: 42},
            }
        };
    }
}