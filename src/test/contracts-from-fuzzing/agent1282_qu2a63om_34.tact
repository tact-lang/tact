// Deep nested chain of non-optional structs
struct Layer3 { val: Int }
struct Layer2 { l3: Layer3 }
struct Layer1 { l2: Layer2 }

contract DeepChain {
    root: Layer1;

    init() {
        self.root = Layer1{
            l2: Layer2{
                l3: Layer3{
                    val: 10
                }
            }
        };
    }
}
