struct DeepOptOptional {
    mid: MidOption?;
}

struct MidOption {
    leaf: Int?;
}

contract NestedOptStorage {
    root: DeepOptOptional;

    init() {
        self.root = DeepOptOptional{
            mid: null
        };
    }
}