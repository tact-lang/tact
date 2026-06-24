struct DeepNested1 { val: Int }
struct DeepNested2 { nested: DeepNested1 }
struct DeepNested3 { nested: DeepNested2 }
struct DeepNested4 { nested: DeepNested3 }
struct DeepNested5 { nested: DeepNested4 }

contract DeepNestedContract {
    data: DeepNested5;

    init() {
        self.data = DeepNested5{
            nested: DeepNested4{
                nested: DeepNested3{
                    nested: DeepNested2{
                        nested: DeepNested1{
                            val: 123
                        }
                    }
                }
            }
        };
    }

    receive() {}
}