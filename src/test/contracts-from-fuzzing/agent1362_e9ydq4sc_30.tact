struct Last {
    val: Int?;
}

struct Mid {
    child: Last?;
}

struct Top {
    mid: Mid?;
}

contract Test {
    s: Top;

    init() {
        self.s = Top{
            mid: Mid{
                child: Last{
                    val: 123
                }
            }
        };
    }

    receive() {}
}