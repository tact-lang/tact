struct MultiLayerOpt {
    inner: OptInner?;
}

struct OptInner {
    text: String?;
    num: Int?;
}

contract TestMultiLayerOpt {
    val: MultiLayerOpt = MultiLayerOpt{ inner: null };

    init() {
        self.val = MultiLayerOpt{
            inner: OptInner{
                text: "hey",
                num: 55
            }
        };
    }
}
