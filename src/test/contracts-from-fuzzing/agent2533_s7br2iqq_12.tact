struct DeepNest5 {
    val: Bool;
}

struct DeepNest4 {
    next: DeepNest5;
}

struct DeepNest3 {
    next: DeepNest4;
}

struct DeepNest2 {
    next: DeepNest3;
}

struct DeepNest1 {
    next: DeepNest2;
}

contract Test {
    deep: DeepNest1;

    init() {
        self.deep = DeepNest1{
            next: DeepNest2{
                next: DeepNest3{
                    next: DeepNest4{
                        next: DeepNest5{
                            val: true,
                        }
                    }
                }
            }
        };
    }
}