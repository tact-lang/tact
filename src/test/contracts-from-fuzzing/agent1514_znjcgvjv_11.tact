struct DeepNest1 { a: Int }
struct DeepNest2 { d1: DeepNest1 }
struct DeepNest3 { d2: DeepNest2 }
struct DeepNest4 { d3: DeepNest3 }
struct DeepNest5 { d4: DeepNest4 }
struct DeepNest6 { d5: DeepNest5 }
struct DeepNest7 { d6: DeepNest6 }

contract Deep7 {
    x: DeepNest7;

    init() {
        self.x = DeepNest7{
            d6: DeepNest6{
                d5: DeepNest5{
                    d4: DeepNest4{
                        d3: DeepNest3{
                            d2: DeepNest2{
                                d1: DeepNest1{ a: 1 }
                            }
                        }
                    }
                }
            }
        };
    }
}