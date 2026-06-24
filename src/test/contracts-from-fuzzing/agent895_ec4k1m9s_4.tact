struct DeepNested1 { a: Int; }
struct DeepNested2 { nest1: DeepNested1; }
struct DeepNested3 { nest2: DeepNested2; }
struct DeepNested4 { nest3: DeepNested3; }

contract DeeplyNested {
    val: DeepNested4;
    
    init() {
        self.val = DeepNested4{
            nest3: DeepNested3{
                nest2: DeepNested2{
                    nest1: DeepNested1{
                        a: 101
                    }
                }
            }
        };
    }
}
