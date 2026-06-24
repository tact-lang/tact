struct DeepNest3 {
    f3: Int;
}

struct DeepNest2 {
    f2: DeepNest3;
}

struct DeepNest1 {
    f1: DeepNest2;
}

contract DeepContract {
    d: DeepNest1;

    init() {
        self.d = DeepNest1{
            f1: DeepNest2{
                f2: DeepNest3{
                    f3: 123
                }
            }
        };
    }
}