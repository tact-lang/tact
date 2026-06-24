struct DeepNest4 {
    s: String;
}

struct DeepNest3 {
    d: DeepNest4;
}

struct DeepNest2 {
    c: DeepNest3;
}

struct DeepNest1 {
    b: DeepNest2;
}

contract FuzzTest {
    x: DeepNest1;

    init() {
        self.x = DeepNest1{
            b: DeepNest2{
                c: DeepNest3{
                    d: DeepNest4{
                        s: "deep"
                    }
                }
            }
        };
    }
}
