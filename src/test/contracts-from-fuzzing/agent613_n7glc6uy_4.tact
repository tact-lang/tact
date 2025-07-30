struct DeepNested1 { a: Int } 
struct DeepNested2 { b: DeepNested1 } 
struct DeepNested3 { c: DeepNested2 } 
struct DeepNested4 { d: DeepNested3 } 
struct DeepNested5 { e: DeepNested4 } 

contract DeepNestingTest {
    val: DeepNested5;

    init() {
        self.val = DeepNested5{
            e: DeepNested4{
                d: DeepNested3{
                    c: DeepNested2{
                        b: DeepNested1{ a: 42 }
                    }
                }
            }
        };
    }
}