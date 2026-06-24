struct DeepNest1 { val: Int; }
struct DeepNest2 { nested: DeepNest1; }
struct DeepNest3 { nested: DeepNest2; }

contract TestContract {
    data: DeepNest3;

    init() {
        self.data = DeepNest3{
            nested: DeepNest2{
                nested: DeepNest1{
                    val: 42
                }
            }
        };
    }
}
