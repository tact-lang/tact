struct Mid {
    a: Int;
    b: String;
}

struct Top {
    mid1: Mid;
    mid2: Mid;
}

contract DeepTwoPaths {
    path: Top;

    init() {
        self.path = Top{
            mid1: Mid{ a: 10, b: "x" },
            mid2: Mid{ a: 20, b: "y" }
        };
    }
}