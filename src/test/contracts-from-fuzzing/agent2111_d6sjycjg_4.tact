struct DeepNest3 {
    c: Int;
}

struct DeepNest2 {
    b: DeepNest3;
}

struct DeepNest1 {
    a: DeepNest2;
}

contract DeeplyNested {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            a: DeepNest2{
                b: DeepNest3{c: 42}
            }
        };
    }
}
