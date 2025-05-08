struct LayerX {
    flag: Bool;
    str: String;
    num: Int;
}

struct LayerY {
    x: LayerX;
    opt: Int?;
}

struct LayerZ {
    y: LayerY;
    ready: Bool;
}

contract MultiLayerFields {
    lz: LayerZ;
    init() {
        self.lz = LayerZ{
            y: LayerY{
                x: LayerX{ flag: true, str: "deep", num: 42 },
                opt: null
            },
            ready: false
        };
    }
}