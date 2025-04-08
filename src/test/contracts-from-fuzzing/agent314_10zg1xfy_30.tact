// nested optionals with deep fallback
struct BottomLayer {
    val: Int?;
}

struct MiddleLayer {
    bottom: BottomLayer?;
}

struct TopLayer {
    middle: MiddleLayer?;
}

contract DeepOptionChain {
    top: TopLayer?;
    init() {
        self.top = null;
    }
}