// Test nested deep null assignment
struct Leaf {
    z: Int?;
}

struct Mid {
    leaf: Leaf?;
}

struct Top {
    mid: Mid?;
}

contract DeepNonNulls {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                leaf: Leaf{ z: 5 }
            }
        };
    }
}
