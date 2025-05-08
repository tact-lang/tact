struct DeepNest4 {
    d: Int;
}

struct DeepNest3 {
    c: DeepNest4;
}

struct DeepNest2 {
    b: DeepNest3;
}

struct DeepNest1 {
    a: DeepNest2;
}

contract FourLevelsDeep {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            a: DeepNest2{
                b: DeepNest3{
                    c: DeepNest4{ d: 42 }
                }
            }
        };
    }
}