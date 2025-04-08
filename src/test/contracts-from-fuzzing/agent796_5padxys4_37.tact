struct DeepNest1 { a: Int; }
struct DeepNest2 { n1: DeepNest1; }
struct DeepNest3 { n2: DeepNest2; }
struct DeepNest4 { n3: DeepNest3; }
struct DeepNest5 { n4: DeepNest4; }
struct DeepNest6 { n5: DeepNest5; }

contract DeepNestedContract {
    data: DeepNest6;
    init() {
        self.data = DeepNest6{
            n5: DeepNest5{
                n4: DeepNest4{
                    n3: DeepNest3{
                        n2: DeepNest2{
                            n1: DeepNest1{ a: 42 }
                        }
                    }
                }
            }
        };
    }
}