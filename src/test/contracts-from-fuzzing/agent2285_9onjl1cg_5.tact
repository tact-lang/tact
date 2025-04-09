struct DeepNest1 { val: Int; }
struct DeepNest2 { nested: DeepNest1; }
struct DeepNest3 { nested: DeepNest2; }
struct DeepNest4 { nested: DeepNest3; }
struct DeepNest5 { nested: DeepNest4; }

contract Test5 {
    data: DeepNest5;

    init() {
        self.data = DeepNest5{
            nested: DeepNest4{
                nested: DeepNest3{
                    nested: DeepNest2{
                        nested: DeepNest1{ val: 123 },
                    },
                },
            },
        };
    }
}