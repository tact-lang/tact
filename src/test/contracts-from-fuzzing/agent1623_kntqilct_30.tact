struct OptLayer1 { a: Int?; }
struct OptLayer2 { l1: OptLayer1?; }
struct OptLayer3 { l2: OptLayer2?; }

contract NestedOptionOption {
    nested: OptLayer3;
    init() {
        self.nested = OptLayer3{
            l2: OptLayer2{
                l1: OptLayer1{
                    a: 999
                }
            }
        };
    }
}