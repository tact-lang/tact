struct DeepNest {
    f1: Int;
    f2: Inner1;
}

struct Inner1 {
    g1: Int;
    g2: Inner2;
}

struct Inner2 {
    h1: Int;
    h2: Bool?;
}

contract TestContract {
    storage: DeepNest;

    init() {
        self.storage = DeepNest{
            f1: 1,
            f2: Inner1{
                g1: 2,
                g2: Inner2{
                    h1: 3,
                    h2: true,
                },
            },
        };
    }
}