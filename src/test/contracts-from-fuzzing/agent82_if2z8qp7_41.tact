struct OptionalChainA {
    next: OptionalChainB?;
}

struct OptionalChainB {
    next: OptionalChainC?;
}

struct OptionalChainC {
    x: Int?;
}

contract Test {
    field: OptionalChainA;
    init() {
        self.field = OptionalChainA { next: null };
    }
}