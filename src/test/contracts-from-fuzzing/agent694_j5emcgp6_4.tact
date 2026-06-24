struct DeepNest1 { a: Int; }
struct DeepNest2 { nested1: DeepNest1; }
struct DeepNest3 { nested2: DeepNest2; }
struct DeepNest4 { nested3: DeepNest3; }

contract TestContract {
    data: DeepNest4;

    init() {
        self.data = DeepNest4{
            nested3: DeepNest3{
                nested2: DeepNest2{
                    nested1: DeepNest1{ a: 123 }
                }
            }
        };
    }
}