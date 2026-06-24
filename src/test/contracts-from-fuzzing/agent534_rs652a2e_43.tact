struct OptLayer3 {
    x: Int?;
}

struct OptLayer2 {
    l3: OptLayer3?;
}

struct OptLayer1 {
    l2: OptLayer2?;
}

contract DeepNullableChain {
    root: OptLayer1;

    init() {
        self.root = OptLayer1{
            l2: null
        };
    }
}