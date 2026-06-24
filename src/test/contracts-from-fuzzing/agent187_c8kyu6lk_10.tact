struct Top {
    mid: Mid;
}

struct Mid {
    low: Low;
}

struct Low {
    val: Int;
}

contract StorageDeepNestTest {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                low: Low{
                    val: 100
                }
            }
        };
    }
}