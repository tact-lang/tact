struct DeepLeaves {
    val: Int?;
    note: String?;
}

struct MidLayer {
    leaf: DeepLeaves?;
}

struct TopLayer {
    mid1: MidLayer;
    mid2: MidLayer?;
}

contract ManyNullPaths {
    root: TopLayer;

    init() {
        self.root = TopLayer{
            mid1: MidLayer{leaf: null},
            mid2: null,
        };
    }
}
