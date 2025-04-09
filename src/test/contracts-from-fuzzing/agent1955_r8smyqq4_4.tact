struct DeepNest1 { val: Int; }
struct DeepNest2 { level1: DeepNest1; }
struct DeepNest3 { level2: DeepNest2; }
struct DeepNest4 { level3: DeepNest3; }
struct DeepNest5 { level4: DeepNest4; }

contract DeepContract {
    data: DeepNest5;

    init() {
        self.data = DeepNest5{
            level4: DeepNest4{
                level3: DeepNest3{
                    level2: DeepNest2{
                        level1: DeepNest1{
                            val: 123,
                        },
                    },
                },
            },
        };
    }
}
