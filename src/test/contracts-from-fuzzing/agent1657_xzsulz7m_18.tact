struct DeepNest1 { n2: DeepNest2; }
struct DeepNest2 { n3: DeepNest3; }
struct DeepNest3 { n4: DeepNest4; }
struct DeepNest4 { n5: DeepNest5; }
struct DeepNest5 { value: Int; }

contract TestContract {
    deep: DeepNest1;
    init() {
        self.deep = DeepNest1{
            n2: DeepNest2{
                n3: DeepNest3{
                    n4: DeepNest4{
                        n5: DeepNest5{value:123}
                    }
                }
            }
        };
    }
}