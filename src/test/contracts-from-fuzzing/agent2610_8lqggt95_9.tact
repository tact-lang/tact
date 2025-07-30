struct OptionalLayerA {
    layerB: OptionalLayerB?;
}

struct OptionalLayerB {
    layerC: OptionalLayerC?;
}

struct OptionalLayerC {
    val1: Int?;
    val2: Int?;
    flag: Bool?;
}

contract TestContract {
    data: OptionalLayerA;
    init() {
        self.data = OptionalLayerA{
            layerB: OptionalLayerB{
                layerC: OptionalLayerC{
                    val1: null,
                    val2: 77,
                    flag: true
                }
            }
        };
    }
}
