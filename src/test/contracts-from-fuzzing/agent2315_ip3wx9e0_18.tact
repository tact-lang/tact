struct DeepNesting1 { x: Int; }
struct DeepNesting2 { x: DeepNesting1; }
struct DeepNesting3 { x: DeepNesting2; }
struct DeepNesting4 { x: DeepNesting3; }
struct DeepNesting5 { x: DeepNesting4; }
struct DeepNesting6 { x: DeepNesting5; }

contract UltraDeepStorage {
    deep: DeepNesting6;

    init() {
        self.deep = DeepNesting6{
            x: DeepNesting5{
                x: DeepNesting4{
                    x: DeepNesting3{
                        x: DeepNesting2{
                            x: DeepNesting1{ x: 77 }
                        }
                    }
                }
            }
        };
    }
}