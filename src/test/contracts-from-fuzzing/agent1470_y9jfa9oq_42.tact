struct Deep {
    val: Int;
}

struct Mid {
    deep: Deep?;
}

struct Top {
    mid: Mid?;
}

contract OptSkipNested {
    data: Top;

    init() {
        self.data = Top{};
    }
}