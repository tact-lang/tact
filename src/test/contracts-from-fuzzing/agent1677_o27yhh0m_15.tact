struct DeepNest3 {
    leaf: Int;
}

struct DeepNest2 {
    inner: DeepNest3;
}

struct DeepNest1 {
    nested: DeepNest2;
}

contract DeepNesting {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            nested: DeepNest2{
                inner: DeepNest3{leaf:42}
            }
        };
    }
}