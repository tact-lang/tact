struct DeepNest {
    l1: OptionalL2?;
}

struct OptionalL2 {
    l2: OptionalL3?;
}

struct OptionalL3 {
    value: Int?;
}

contract DeepOptionalContract {
    deep: DeepNest;
    
    init() {
        self.deep = DeepNest { l1: null };
    }
}