struct TwoLayers {
    inner1: Int?;
    inner2: String?;
}

struct OneLayer {
    nested: TwoLayers?;
}

contract TestContract {
    data: OneLayer;

    init() {
        self.data = OneLayer{ nested: null };
    }
}