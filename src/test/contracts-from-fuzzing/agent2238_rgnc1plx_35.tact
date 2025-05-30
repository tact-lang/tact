// Try deeply nested optional chain (one opt wrapping whole struct)
struct DeepOpt {
    nested: Mid?;
}

struct Mid {
    val: Int?;
}

contract TestContract {
    d: DeepOpt;

    init() {
        self.d = DeepOpt{
            nested: Mid{val:null}
        };
    }
}
