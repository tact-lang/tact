// Deeply nested optionals inside nested structs
struct SInnerMost {
    z: Int?;
}

struct SInner {
    y: SInnerMost?;
}

struct SOuter {
    x: SInner?;
}

contract DeepOptionalNest {
    s: SOuter;

    init() {
        self.s = SOuter{
            x: SInner{
                y: SInnerMost{
                    z: null
                }
            }
        };
    }
}
