struct DeepNest1 { x: Int }
struct DeepNest2 { d1: DeepNest1 }
struct DeepNest3 { d2: DeepNest2 }
struct DeepNest4 { d3: DeepNest3 }
struct DeepNest5 { d4: DeepNest4 }

contract DeepFive {
    z: DeepNest5;
    init() {
        self.z = DeepNest5{
            d4: DeepNest4{
                d3: DeepNest3{
                    d2: DeepNest2{
                        d1: DeepNest1{ x: 777 },
                    },
                },
            },
        };
    }
}