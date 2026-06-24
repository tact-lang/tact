struct DeepNested1 { a: Int }
struct DeepNested2 { a: DeepNested1 }
struct DeepNested3 { a: DeepNested2 }
struct DeepNested4 { a: DeepNested3 }

contract DeepNestedStorage {
    val: DeepNested4;

    init() {
        self.val = DeepNested4{
            a: DeepNested3{
                a: DeepNested2{
                    a: DeepNested1{
                        a: 123
                    }
                }
            }
        };
    }
}
