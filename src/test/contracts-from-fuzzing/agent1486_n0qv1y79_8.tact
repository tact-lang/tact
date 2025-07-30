struct Leaf {
    val: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct High {
    mid: Mid?;
}

contract DeepOptionals {
    data: High;

    init() {
        self.data = High{
            mid: null
        };
    }
}