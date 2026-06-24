struct DeeplyNested1 { x: Int; }
struct DeeplyNested2 { x: DeeplyNested1; }
struct DeeplyNested3 { x: DeeplyNested2; }
struct DeeplyNested4 { x: DeeplyNested3; }
struct DeeplyNested5 { x: DeeplyNested4; }

contract TestDeepChain {
    data: DeeplyNested5;

    init() {
        self.data = DeeplyNested5 {
            x: DeeplyNested4 {
                x: DeeplyNested3 {
                    x: DeeplyNested2 {
                        x: DeeplyNested1 { x: 42 }
                    }
                }
            }
        };
    }
}