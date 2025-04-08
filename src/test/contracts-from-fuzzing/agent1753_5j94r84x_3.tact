struct DeepNest3 {
    iii: Int;
}

struct DeepNest2 {
    nn: DeepNest3;
}

struct DeepNest1 {
    mm: DeepNest2;
}

contract VeryDeep {
    data: DeepNest1;
    init() {
        self.data = DeepNest1{
            mm: DeepNest2{
                nn: DeepNest3{
                    iii: 777,
                },
            },
        };
    }
}
