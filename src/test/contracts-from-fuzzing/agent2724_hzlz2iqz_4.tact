struct DeepNest1 {
    a: Int;
}

struct DeepNest2 {
    n1: DeepNest1;
}

struct DeepNest3 {
    n2: DeepNest2;
}

contract VeryDeepContract {
    data: DeepNest3;

    init() {
        self.data = DeepNest3{
            n2: DeepNest2{
                n1: DeepNest1{
                    a: 42,
                },
            },
        };
    }
}