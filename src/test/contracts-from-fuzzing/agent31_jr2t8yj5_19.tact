struct DeepOpt {
    i: Int?;
    s: NestedOpt?;
}

struct NestedOpt {
    b: Bool?;
    s: DeeperOpt?;
}

struct DeeperOpt {
    s: String?;
}

contract Test {
    x: DeepOpt;
    init() {
        self.x = DeepOpt{
            i: null,
            s: null,
        };
    }
}
