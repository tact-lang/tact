struct DeepNested1 { v1: Int }
struct DeepNested2 { v2: DeepNested1 }
struct DeepNested3 { v3: DeepNested2 }
struct DeepNested4 { v4: DeepNested3 }

contract DeepContract {
    deep_field: DeepNested4;
    
    init() {
        self.deep_field = DeepNested4{
            v4: DeepNested3{
                v3: DeepNested2{
                    v2: DeepNested1{
                        v1: 42
                    }
                }
            }
        };
    }
}