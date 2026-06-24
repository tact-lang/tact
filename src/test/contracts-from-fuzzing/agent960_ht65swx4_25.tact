struct MultiLayerOpt {
    inner1: Int?;
    inner2: String?;
}

struct WrapperOpt {
    wrap: MultiLayerOpt?;
    extra: Bool;
}

contract MultiOpt {
    data: WrapperOpt;
    init() {
        self.data = WrapperOpt{
            wrap: MultiLayerOpt{inner1:null, inner2:null},
            extra: true
        };
    }
}