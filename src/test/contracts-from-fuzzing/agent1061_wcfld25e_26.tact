// Optional fields nested multiple layers, mixture of initialized and defaults
struct Leaf { score: Int?; }

struct Mid { left: Leaf?; right: Leaf; }

struct Root { branch: Mid?; value: Int; }

contract Test {
    data: Root;

    init() {
        self.data = Root{
            branch: Mid{
                left: null,
                right: Leaf{ score: null }
            },
            value: 42
        };
    }
}