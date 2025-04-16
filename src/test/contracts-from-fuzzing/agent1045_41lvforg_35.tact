struct Deep {
    x: Int;
}

struct Mid {
    deep: Deep?;
}

struct Top {
    mid: Mid?;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                deep: null
            }
        };
    }
}