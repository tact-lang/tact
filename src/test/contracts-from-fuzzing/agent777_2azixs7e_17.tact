struct InnerMost {
    deepInt: Int;
}

struct WrapMid {
    wrap: InnerMost;
    opt: Int?;
}

struct OuterLayer {
    mid1: WrapMid;
    mid2: WrapMid;
}

contract DeepRecursive {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            mid1: WrapMid{wrap: InnerMost{deepInt:1}, opt: null},
            mid2: WrapMid{wrap: InnerMost{deepInt:2}, opt: 99}
        };
    }
}