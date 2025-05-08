struct InnerDeeply {
    x: Int;
}

struct MidLayer {
    inner: InnerDeeply;
}

struct OuterLayer {
    mid: MidLayer;
}

contract Compose3Layers {
    data: OuterLayer;
    
    init() {
        self.data = OuterLayer{
            mid: MidLayer{ inner: InnerDeeply{ x: 42 } }
        };
    }
}