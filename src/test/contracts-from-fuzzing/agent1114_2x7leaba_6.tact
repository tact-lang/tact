struct DeepNested1 { x: Int; }
struct DeepNested2 { y: DeepNested1; }
struct DeepNested3 { z: DeepNested2; }
struct DeepNested4 { w: DeepNested3; }

contract DeepStorage {
    a: DeepNested4;
    init() {
        self.a = DeepNested4{
            w: DeepNested3{
                z: DeepNested2{
                    y: DeepNested1{x: 99}
                }
            }
        };
    }
}