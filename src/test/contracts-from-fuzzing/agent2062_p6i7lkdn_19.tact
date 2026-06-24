struct BaseOpt {
    x: Int?;
}

struct Layer2 {
    inner: BaseOpt?;
}

struct Layer3 {
    inner: Layer2?;
}

contract MultiLayerOpt {
    layer3: Layer3?;
    init() { self.layer3 = null; }
}