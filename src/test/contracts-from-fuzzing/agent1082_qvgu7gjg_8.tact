struct Top {
    mid: Mid;
}

struct Mid {
    low: Low;
}

struct Low {
    value: Int;
}

contract DeepContract {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                low: Low{
                    value: 999
                }
            }
        };
    }
}
