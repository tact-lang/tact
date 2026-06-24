struct DeepNest1 { 
    v: Int; 
}

struct DeepNest2 { 
    d1: DeepNest1; 
}

struct DeepNest3 { 
    d2: DeepNest2; 
}

struct DeepNest4 { 
    d3: DeepNest3; 
}

contract Test {
    store: DeepNest4 = DeepNest4{
        d3: DeepNest3{
            d2: DeepNest2{
                d1: DeepNest1{ v: 5 }
            }
        }
    };

    init() {
        self.store = DeepNest4{
            d3: DeepNest3{
                d2: DeepNest2{
                    d1: DeepNest1{ v: 77 }
                }
            }
        };
    }
}
