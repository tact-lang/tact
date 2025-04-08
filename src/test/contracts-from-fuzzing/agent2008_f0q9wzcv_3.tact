struct DeepNested1 { val: Int; }
struct DeepNested2 { next: DeepNested1; }
struct DeepNested3 { next: DeepNested2; }
struct DeepNested4 { next: DeepNested3; }

contract DeepNestedTest {
    data: DeepNested4;

    init() {
        self.data = DeepNested4{
            next: DeepNested3{
                next: DeepNested2{
                    next: DeepNested1{val: 777}
                }
            }
        };
    }
}
