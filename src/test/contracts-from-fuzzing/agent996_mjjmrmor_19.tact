struct OptionalDeepNest {
    x: OptionalInner?;
}

struct OptionalInner {
    y: OptionalLeaf?;
}

struct OptionalLeaf {
    z: Int?;
}

contract TestStorage {
    val: OptionalDeepNest;

    init() {
        self.val = OptionalDeepNest{
            x: OptionalInner{
                y: OptionalLeaf{
                    z: 5
                }
            }
        };
    }
}