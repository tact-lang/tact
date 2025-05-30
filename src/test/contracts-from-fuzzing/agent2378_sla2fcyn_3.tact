struct Deep1 { x: Int; }
struct Deep2 { d1: Deep1; y: Int; }
struct Deep3 { d2: Deep2; z: Int; }

contract DeepChain {
    field: Deep3;
    init() {
        self.field = Deep3{
            d2: Deep2{
                d1: Deep1{ x: 10 },
                y: 20
            },
            z: 30
        };
    }
}