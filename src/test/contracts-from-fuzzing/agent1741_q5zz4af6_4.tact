struct DeepNested1 { x: Int }
struct DeepNested2 { y: DeepNested1 }
struct DeepNested3 { z: DeepNested2 }
struct DeepNested4 { w: DeepNested3 }

contract TestDeepNesting {
    val: DeepNested4;

    init() {
        self.val = DeepNested4{
            w: DeepNested3{
                z: DeepNested2{
                    y: DeepNested1{ x: 42 }
                }
            }
        };
    }
}