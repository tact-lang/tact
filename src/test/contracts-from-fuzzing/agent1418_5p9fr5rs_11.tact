struct DeepNest4 {
    data: Int?;
}

struct DeepNest3 {
    next: DeepNest4?;
}

struct DeepNest2 {
    next: DeepNest3?;
}

struct DeepNest1 {
    next: DeepNest2?;
}

contract DeepNullableChains {
    chain: DeepNest1?;

    init() {
        self.chain = null;
    }
}