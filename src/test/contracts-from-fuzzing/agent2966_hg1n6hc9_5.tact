struct DeeplyNested1 { x: Int; }
struct DeeplyNested2 { y: DeeplyNested1; }
struct DeeplyNested3 { z: DeeplyNested2; }
struct DeeplyNested4 { w: DeeplyNested3; }

contract DeepContract {
    deep: DeeplyNested4;
    
    init() {
        self.deep = DeeplyNested4{
            w: DeeplyNested3{
                z: DeeplyNested2{
                    y: DeeplyNested1{ x: 123 }
                }
            }
        };
    }
}
