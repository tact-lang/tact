struct OneOptLayer {
    a: Int?;
}

struct TwoOptLayer {
    inner: OneOptLayer?;
}

contract MultiLayerOpt {
    val: TwoOptLayer;
    init() {
        self.val = TwoOptLayer{ inner: null };
    }
}