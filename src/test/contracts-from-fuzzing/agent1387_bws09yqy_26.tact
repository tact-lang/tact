struct DeepA { aa: Int; ab: Bool }
struct DeepB { ba: Int?; bb: DeepA }
struct DeepC { ca: DeepB; cb: Int }

contract DeepChain {
    nested: DeepC;

    init() {
        self.nested = DeepC{
            ca: DeepB{
                ba: null,
                bb: DeepA{ aa:1, ab:true }
            },
            cb: 99
        };
    }
}