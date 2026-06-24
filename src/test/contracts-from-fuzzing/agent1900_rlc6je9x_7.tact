struct Middle {
    low: Low;
    val: Int;
}

struct Low {
    flag: Bool;
}

struct Top {
    mid: Middle;
}

contract DeepAssign {
    top: Top;

    init() {
        self.top = Top{
            mid: Middle{
                low: Low{
                    flag: false
                },
                val: 99
            }
        };
    }
}