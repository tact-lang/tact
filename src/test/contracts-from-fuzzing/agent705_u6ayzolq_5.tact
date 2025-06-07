struct DeepNested1 { a: Int; }
struct DeepNested2 { n: DeepNested1; }
struct DeepNested3 { n: DeepNested2; }
struct DeepNested4 { n: DeepNested3; }

contract DeepNestedContract {
    data: DeepNested4;

    init() {
        self.data = DeepNested4{
            n: DeepNested3{
                n: DeepNested2{
                    n: DeepNested1{ a: 42 }
                }
            }
        };
    }
}
