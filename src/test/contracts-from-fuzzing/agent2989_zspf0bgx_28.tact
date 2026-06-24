// Testing many nested optional structs
struct OptInner {
    val: Int?;
}

struct OptMid {
    inside: OptInner?;
}

struct OptOuter {
    layer: OptMid?;
}

contract NullableLayers {
    storage: OptOuter;

    init() {
        self.storage = OptOuter{
            layer: OptMid{
                inside: null
            }
        };
    }
}
