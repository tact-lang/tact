struct DeepNested1 { val: Int; }
struct DeepNested2 { nested: DeepNested1; }
struct DeepNested3 { nested: DeepNested2; }
struct DeepNested4 { nested: DeepNested3; }

contract VeryDeepNested {
    data: DeepNested4;

    init() {
        self.data = DeepNested4{
            nested: DeepNested3{
                nested: DeepNested2{
                    nested: DeepNested1{
                        val: 42
                    }
                }
            }
        };
    }
}