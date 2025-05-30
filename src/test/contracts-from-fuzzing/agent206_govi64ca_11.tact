struct OptionalLeaf {
    x: Int?;
}

struct MidLayer {
    ol: OptionalLeaf?;
}

struct Root {
    mid: MidLayer?;
}

contract DeepOptionals {
    root: Root? = null;

    init() {
        self.root = Root{
            mid: MidLayer{
                ol: OptionalLeaf{
                    x: 42
                }
            }
        };
    }
}
