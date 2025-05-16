struct DeepNest1 { f1: Int; }
struct DeepNest2 { f2: DeepNest1; }
struct DeepNest3 { f3: DeepNest2; }
struct DeepNest4 { f4: DeepNest3; }
struct DeepNest5 { f5: DeepNest4; }

contract VeryDeepNested {
    n: DeepNest5;
    init() {
        self.n = DeepNest5{
            f5: DeepNest4{
                f4: DeepNest3{
                    f3: DeepNest2{
                        f2: DeepNest1{ f1: 99 }
                    }
                }
            }
        };
    }
}