struct InnerOpt {
    val: Int?;
}

struct MidOpt {
    inner: InnerOpt?;
}

contract DoubleLayerOptional {
    f: MidOpt;
    
    init() {
        self.f = MidOpt{ inner: null };
    }
}
