struct DeepOpt {
    a: Int?;
    b: NestedOpt;
}

struct NestedOpt {
    x: Bool?;
    y: String?;
    z: Address?;
}

contract TestContract {
    store: DeepOpt;

    init() {
        self.store = DeepOpt{
            a: null,
            b: NestedOpt { x: null, y: null, z: null }
        };
    }
}