struct Bottom {
    val: Int?;
}

struct Mid {
    node: Bottom?;
}

struct Top {
    mid: Mid?;
}

contract DeepOption {
    data: Top;

    init() {
        self.data = Top{ mid: null };
    }
}