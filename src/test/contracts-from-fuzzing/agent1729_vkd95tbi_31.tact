struct DeepComplicateA { x: Int; y: Int; }
struct DeepComplicateB { aa: DeepComplicateA; bb: DeepComplicateA; }
struct DeepComplicateC { b1: DeepComplicateB; b2: DeepComplicateB; }
struct DeepComplicateD { c: DeepComplicateC; }

contract DeepNestMax {
    deepField: DeepComplicateD;

    init() {
        self.deepField = DeepComplicateD{
            c: DeepComplicateC{
                b1: DeepComplicateB{
                    aa: DeepComplicateA{x:1,y:2},
                    bb: DeepComplicateA{x:3,y:4}
                },
                b2: DeepComplicateB{
                    aa: DeepComplicateA{x:5,y:6},
                    bb: DeepComplicateA{x:7,y:8}
                }
            }
        };
    }
}