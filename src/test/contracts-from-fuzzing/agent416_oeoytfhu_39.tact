struct MiddleLayer {
    flag: Bool;
}

struct TopLayer {
    middle: MiddleLayer?;
}

contract Test39 {
    data: TopLayer;

    init() {
        self.data = TopLayer{
            middle: null
        };
    }
}
