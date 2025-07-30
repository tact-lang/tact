struct DeepNest3 {
    x: Int;
}

struct DeepNest2 {
    middle: DeepNest3;
}

struct DeepNest1 {
    outer: DeepNest2;
}

contract DeepNesting {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            outer: DeepNest2{
                middle: DeepNest3{
                    x: 99
                }
            }
        };
    }
}
