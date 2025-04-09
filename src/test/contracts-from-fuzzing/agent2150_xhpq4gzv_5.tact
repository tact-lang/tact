struct DeepNest1 {
    next: DeepNest2;
}

struct DeepNest2 {
    next: DeepNest3;
}

struct DeepNest3 {
    next: DeepNest4;
}

struct DeepNest4 {
    next: DeepNest5;
}

struct DeepNest5 {
    val: Int;
}

contract TestContract {
    f: DeepNest1;

    init() {
        self.f = DeepNest1{
            next: DeepNest2{
                next: DeepNest3{
                    next: DeepNest4{
                        next: DeepNest5{
                            val: 42
                        }
                    }
                }
            }
        };
    }
}