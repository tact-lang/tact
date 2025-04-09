struct DeepNest4 {
    z: Int;
}

struct DeepNest3 {
    q: DeepNest4;
}

struct DeepNest2 {
    r: DeepNest3;
}

struct DeepNest1 {
    s: DeepNest2;
}

contract TestContract {
    deep: DeepNest1;
    init() {
        self.deep = DeepNest1{
            s: DeepNest2{
                r: DeepNest3{
                    q: DeepNest4{ z: 42 },
                }
            }
        };
    }
}